import numpy as np
from scipy.optimize import minimize_scalar, minimize
from scipy import interpolate
import time
import matplotlib.pyplot as plt

# Parameters - households and girms
beta = 0.96  # discount factor
eta = 2.0    # coefficient of relative risk aversion
gamma = 0.5  # disutility from working
alpha = 0.36 # capital share in production
delta = 0.1  # depreciation rate
omega = 0.1  # parent education time factor
phi_p = 0.5  # share of parental input in education
psi_e = 0.5  # CES parameter for education inputs
theta_I = 0.7  # human capital investment effectiveness

#Parameters - government
Ie_gdp = 0.02 # public education investment as percent of GDP
Iz_gdp = 0.04 # public infrastructure investment as percent of GDP percent of GDP
sigma_bar = 0.2  # public investment inefficiency
G = 0.1  # grants (as a fraction of GDP)
psi = 0.1    # public infrastructure elasticity
nu = 0.6     # debt-to-GDP ratio limit

# Grid sizes
nk = 100  # number of points in capital grid
nh = 50   # number of points in human capital grid
nZ = 20   # number of points in public infrastructure grid

# Create grids
k_grid = np.linspace(0, 20, nk)
h_grid = np.linspace(1, 10, nh)
Z_grid = np.linspace(1, 10, nZ)

# Number of periods
T = 60
working_periods = 37
parent_periods = 18

def production(K, H, L, Z):
    return Z**psi * K**alpha * (H * L)**(1-alpha)

def wage_rate(K, H, L, Z):
    return H * (1 - alpha) * Z**psi * (K / (H * L))**alpha

def interest_rate(K, H, L, Z):
    return alpha * Z**psi * (H * L / K)**(1-alpha) - delta

def utility(c, l):
    return ((c * (1-l)**gamma)**(1-eta) - 1) / (1-eta)

def human_capital_investment(e, I_e, h):
    I_c = (phi_p * (e)**psi_e + (1 - phi_p) * (I_e / 18)**psi_e)**(1 / psi_e)
    return I_c**theta_I * h**(1 - theta_I)

def bellman_operator(V, s, K, H, L, Z, I_e, tau, T):
    V_next = np.zeros_like(V)
    w = wage_rate(K, H, L, Z)
    r = interest_rate(K, H, L, Z)
    
    for i, k in enumerate(k_grid):
        for j, h in enumerate(h_grid):
            if s >= working_periods:
                # Retired
                c = (1 + r) * k + T  # Simplified consumption for retirees
                V_next[i, j] = utility(c, 1) + beta * V[i, j] if s < T-1 else utility(c, 1)
            else:
                # Working
                if s <= parent_periods:
                    # Working parent
                    def objective(x):
                        c, l, e = x
                        if c <= 0 or l < 0 or l > 1 or e < 0 or e > 1-l:
                            return np.inf
                        
                        h_child_next = human_capital_investment(e, I_e, h)
                        k_next = (1 - tau) * w * h * l + (1 + r - delta) * k - (1 + tau) * c
                        
                        if k_next < k_grid[0] or k_next > k_grid[-1]:
                            return np.inf
                        
                        V_interp = interpolate.interpn((k_grid, h_grid), V, (k_next, h_child_next), method='linear', bounds_error=False, fill_value=None)
                        return -(utility(c, 1-l-e) + beta * V_interp)
                    
                    result = minimize(objective, [k/2, 0.5, 0.1], method='L-BFGS-B', bounds=((0, k+w*h), (0, 1), (0, 1)))
                    V_next[i, j] = -result.fun
                else:
                    # Working empty-nester
                    def objective(x):
                        c, l = x
                        if c <= 0 or l < 0 or l > 1:
                            return np.inf
                        
                        k_next = (1 - tau) * w * h * l + (1 + r - delta) * k - (1 + tau) * c
                        
                        if k_next < k_grid[0] or k_next > k_grid[-1]:
                            return np.inf
                        
                        V_interp = interpolate.interpn((k_grid, h_grid), V, (k_next, h), method='linear', bounds_error=False, fill_value=None)
                        return -(utility(c, 1-l) + beta * V_interp)
                    
                    result = minimize(objective, [k/2, 0.5], method='L-BFGS-B', bounds=((0, k+w*h), (0, 1)))
                    V_next[i, j] = -result.fun
    
    return V_next

def solve_household_problem(K, H, L, Z, I_e, tau, T):
    V = np.zeros((nk, nh, T))
    
    for t in range(T-1, -1, -1):
        V[:, :, t] = bellman_operator(V[:, :, t], t, K, H, L, Z, I_e, tau, T)
    
    return V

def government_budget(Y, K, H, L, Z, I_e, I_z, tau, T, D_prev, r_prev):
    tax_revenue = tau * (wage_rate(K, H, L, Z) * H * L + (r_prev - delta) * K)
    D = r_prev * D_prev + I_e + I_z + T - G * Y - tax_revenue
    return D

def solve_steady_state(max_iter=100, tol=1e-4):
    # Initial guesses
    K = np.mean(k_grid)
    H = np.mean(h_grid)
    L = 0.3
    Z = np.mean(Z_grid)
    tau = 0.2  # Initial guess for tax rate
    T = 0.1  # Initial guess for transfers
    D = 0
    
    for _ in range(max_iter):
        Y = production(K, H, L, Z)
        I_e = Ie_gdp * Y  
        I_z = Iz_gdp * Y  
        r = interest_rate(K, H, L, Z)
        w = wage_rate(K, H, L, Z)
        
        V = solve_household_problem(K, H, L, Z, I_e, tau, T)
        
        # Compute new aggregates
        K_new = 0
        H_new = 0
        L_new = 0
        for s in range(T):
            if s < working_periods:
                policy = lambda k, h: minimize(lambda x: -V[np.searchsorted(k_grid, k), np.searchsorted(h_grid, h), s], 
                                               [k/2, 0.5, 0.1] if s <= parent_periods else [k/2, 0.5], 
                                               method='L-BFGS-B').x
                K_new += np.mean([policy(k, h)[0] for k in k_grid for h in h_grid])
                H_new += np.mean([h for _ in k_grid for h in h_grid])
                L_new += np.mean([policy(k, h)[1] for k in k_grid for h in h_grid])
        
        K_new /= T
        H_new /= T
        L_new /= working_periods
        
        D_new = government_budget(Y, K, H, L, Z, I_e, I_z, tau, T, D, r)
        
        # Adjust tax rate and transfers to balance budget
        def budget_balance(x):
            tau_new, T_new = x
            return abs(government_budget(Y, K_new, H_new, L_new, Z, I_e, I_z, tau_new, T_new, D_new, r))
        
        result = minimize(budget_balance, [tau, T], method='Nelder-Mead')
        tau_new, T_new = result.x
        
        # Check convergence
        if (abs(K_new - K) < tol and abs(H_new - H) < tol and abs(L_new - L) < tol and 
            abs(tau_new - tau) < tol and abs(T_new - T) < tol):
            break
        
        # Update variables
        K, H, L, tau, T, D = K_new, H_new, L_new, tau_new, T_new, D_new
        
        # Update public infrastructure
        Z = (1 - delta) * Z + (1 - sigma_bar) * I_z
    
    return K, H, L, Z, I_e, I_z, tau, T, D, Y

# Solve for steady state
K_ss, H_ss, L_ss, Z_ss, I_e_ss, I_z_ss, tau_ss, T_ss, D_ss, Y_ss = solve_steady_state()

print("Steady State Results:")
print(f"Capital (K): {K_ss:.4f}")
print(f"Human Capital (H): {H_ss:.4f}")
print(f"Labor (L): {L_ss:.4f}")
print(f"Public Infrastructure (Z): {Z_ss:.4f}")
print(f"Education Investment (I_e): {I_e_ss:.4f}")
print(f"Infrastructure Investment (I_z): {I_z_ss:.4f}")
print(f"Tax Rate (tau): {tau_ss:.4f}")
print(f"Transfers (T): {T_ss:.4f}")
print(f"Public Debt (D): {D_ss:.4f}")
print(f"Output (Y): {Y_ss:.4f}")