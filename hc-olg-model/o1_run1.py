# -*- coding: utf-8 -*-
"""
Modified program to solve for the steady states of the given macroeconomic model.

Based on the original program AK60_value.py by heerburk.

"""

# Part 1: Import libraries
import numpy as np
from scipy import interpolate
from scipy.optimize import fsolve
import time
import math
import matplotlib.pyplot as plt
plt.rcParams['figure.figsize'] = (10,6)

# Abbreviations
exp = np.e
log = math.log

# Part 2: Define functions

# Production function
def production(k_prev, h, l):
    return tfp * k_prev**alpha * (h * l)**(1 - alpha)

# Wage rate function
def wage_rate(k_prev, h, l):
    return tfp * (1 - alpha) * (k_prev)**alpha * (h * l)**(-alpha)

# Interest rate function
def interest_rate(k_prev, h, l):
    return tfp * alpha * (h * l)**(1 - alpha) * k_prev**(alpha - 1) - delta

# Tax revenue function
def tax_revenue(w, r, k_prev, h, l):
    return tau * w * h * l + tau * r * max(k_prev, 0)

# Government transfers
def transfers(tax_revenue, G):
    return tax_revenue + G

# Utility function
def utility(c, l):
    if eta == 1:
        return log((c + small)) + gamma * log(1 - l)
    else:
        return (((c + small) * (1 - l)**gamma)**(1 - eta) - 1) / (1 - eta)

# Golden section search for maximization
def GoldenSectionMax(f, a, b, c, tol):
    r1 = 0.61803399
    r2 = 1 - r1
    x0 = a
    x3 = c
    if abs(c - b) > abs(b - a):
        x1 = b
        x2 = b + r2 * (c - b)
    else:
        x2 = b
        x1 = b - r2 * (b - a)
    f1 = f(x1)
    f2 = f(x2)
    while abs(x3 - x0) > tol * (abs(x1) + abs(x2)):
        if f2 < f1:
            x0 = x1
            x1 = x2
            x2 = r1 * x1 + r2 * x3
            f1 = f2
            f2 = f(x2)
        else:
            x3 = x2
            x2 = x1
            x1 = r1 * x2 + r2 * x0
            f2 = f1
            f1 = f(x1)
    if f1 < f2:
        return x1
    else:
        return x2

# Part 3: Set numerical parameters

# Model parameters
tfp = 1.0          # Total Factor Productivity
alpha = 0.33       # Capital share in production
beta = 0.96        # Discount factor
delta = 0.08       # Depreciation rate
gamma = 2.0        # Leisure preference parameter
eta = 1.5          # Relative risk aversion coefficient
tau = 0.2          # Tax rate
G = 0.0            # Government spending
h = 1.0            # Time endowment (maximum hours available)
small = 1e-6       # Small constant to avoid zero consumption
psi = 1e-6         # Small constant for utility function
tol = 1e-6         # Tolerance for convergence
neg = -1e10        # Large negative number for infeasible consumption

# Grid parameters
kmin = 0.0         # Minimum capital
kmax = 10.0        # Maximum capital
na = 200           # Number of grid points for capital
k_grid = np.linspace(kmin, kmax, na)  # Capital grid
aeps = (k_grid[1] - k_grid[0]) / na   # Small increment for capital

# Initial guesses
k_init = 5.0       # Initial capital
l_init = 0.3       # Initial labor supply
k_old = k_init
l_old = l_init

# Start clock
start_time = time.time()

# Part 4: Value Function Iteration

# Initialize value function
V = np.zeros(na)
V_new = np.zeros(na)
policy_k = np.zeros(na)
policy_l = np.zeros(na)
max_iter = 500
iteration = 0
diff = tol + 1

# Main iteration loop
while iteration < max_iter and diff > tol:
    iteration += 1
    V_interp = interpolate.interp1d(k_grid, V, kind='linear', fill_value='extrapolate')
    V_new = np.zeros(na)
    for i, k0 in enumerate(k_grid):
        # Optimization over k' and l
        def obj(k_next):
            # Labor supply optimization (can be extended to optimize over l)
            l_opt = l_init  # Assume fixed labor supply for simplicity
            w = wage_rate(k0, h, l_opt)
            r = interest_rate(k0, h, l_opt)
            T = transfers(tax_revenue(w, r, k0, h, l_opt), G)
            c = (1 - tau) * w * h * l_opt + (1 + r) * k0 - tau * r * max(k0, 0) + T - k_next
            if c <= 0 or k_next < kmin or k_next > kmax:
                return neg
            else:
                return -(utility(c, l_opt) + beta * V_interp(k_next))
        # Golden section search over k'
        k_next_opt = GoldenSectionMax(obj, kmin, k0, kmax, tol)
        V_new[i] = -obj(k_next_opt)
        policy_k[i] = k_next_opt
        policy_l[i] = l_init  # Fixed labor supply
    diff = np.max(np.abs(V_new - V))
    V = np.copy(V_new)
    print(f"Iteration {iteration}, max difference {diff}")

# Part 5: Compute Steady-State Values

# Interpolate policy function
policy_k_interp = interpolate.interp1d(k_grid, policy_k, kind='linear', fill_value='extrapolate')

# Find the steady-state capital where k' = k
def steady_state_k(k_ss):
    return k_ss - policy_k_interp(k_ss)

# Solve for steady-state capital
k_ss_guess = k_init
k_ss = fsolve(steady_state_k, k_ss_guess)[0]

# Compute steady-state variables
l_ss = l_init  # Fixed labor supply
w_ss = wage_rate(k_ss, h, l_ss)
r_ss = interest_rate(k_ss, h, l_ss)
T_ss = transfers(tax_revenue(w_ss, r_ss, k_ss, h, l_ss), G)
c_ss = (1 - tau) * w_ss * h * l_ss + (1 + r_ss) * k_ss - tau * r_ss * max(k_ss, 0) + T_ss - k_ss
y_ss = production(k_ss, h, l_ss)
utility_ss = utility(c_ss, l_ss)

# Output results
print("\nSteady-State Results:")
print(f"Capital (k): {k_ss}")
print(f"Labor (l): {l_ss}")
print(f"Output (y): {y_ss}")
print(f"Consumption (c): {c_ss}")
print(f"Wage Rate (w): {w_ss}")
print(f"Interest Rate (r): {r_ss}")
print(f"Utility: {utility_ss}")

# Plotting policy functions
plt.figure()
plt.plot(k_grid, policy_k, label='Policy Function for Capital')
plt.plot(k_grid, k_grid, label='45-degree Line')
plt.xlabel('Current Capital k')
plt.ylabel('Next Period Capital k\'')
plt.title('Policy Function for Capital')
plt.legend()
plt.show()

# End clock
end_time = time.time()
print(f"Runtime: {end_time - start_time} seconds")
