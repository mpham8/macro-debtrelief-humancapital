/* dr_ylim_jul8_2020 [Dynare model file]
 * Based on debtrelief_ylim_jul8_2020.mod 
 * Run setpathdynare457_soc.m first.
 * By Steve O'Connell / July 8, 2020, revised August 2, 2020.
 *
 * This replaces the fixed debt limit in debtrelief_jul5_2020 with
 * the Detragiache (1992) specification d<=ds*y. It introduces the 
 * parameter ds and converts dl to the endogenous variable dl = ds*k
 * with ds = 0.4.
 * For steady state calculations see steadystates_jul5_2020.m.
*/

// Endogenous variables
var y d c r ig s k v dgap z dl;

// Exogenous variable: TFP, tax rate on GDP, debt cancellation
varexo x tau eps_dc;

// Parameters declaration and calibration
parameters alph gam delt rho mu g rw ds;
alph=0.33;  //capital share, JNF = 0.5
gam=2;      //relative risk aversion, JNF = 1/0.34
delt=0.2;   //depreciation rate, JNF = 0.3, still way too high
rho=0.07;   //rate of time preference, JNF = 0.05
mu=0.5;     //adjustment cost parameter, JNF = 0.517
g=0.15;  //government spending, about 20% of SS GDP, JNF = 0.05
rw=0.05;    //world interest rate < rho, JNF = 0.04
ds=0.40;    //external debt limit is d <= ds*y
//aa=1;     //I have removed this TFP scaling factor (was 0.5 in ramst.mod)

// Equilibrium conditions:
model;
   // 1. Production function
y = x*k(-1)^alph;
   // 2. Resource constraint
d = d(-1) + rw*d(-1) + c + ig + g - y - eps_dc; 
   // 3. Euler equation
c^(-gam) = (1+rho)^(-1)*(1+r)*c(+1)^(-gam); 
   // 4. Investment function
ig = k(-1) * (delt + (1/mu)*(1-(c^(-gam)/s)));
   // 5. Shadow price on capital, modified for endogenous debt limit
s = (1+rho)^(-1)*( c(+1)^(-gam)*(1-tau)*alph*x(+1)*k^(alph-1)
  + s(+1)*(1 - delt + (mu/2)*((ig(+1)/k)^2-delt^2)) 
  + ds*v(+1)*alph*x(+1)*k^(alph-1) );
   // 6. Dynamics of capital stock
k = (1-delt)*k(-1) + ig - (mu/2)*(((ig/k(-1))-delt)^2)*k(-1);
   // 7. Shadow price on borrowing constraint
v = (1+rho)^(-1)*(r - rw)*s(+1);
   // 8. Debt limit
dl = ds*y;
   // 9. and 10. Complementary slackness
dgap = dl - d;
dgap = max(0,dgap - v); 
   // 10. Interest-rate spread
z = r - rw;
end;

// Steady state (analytically solved)
initval;
x = 1;
eps_dc = 0;
tau = 0.20;
k = (x*alph*(1-tau)*(1 + (ds*(rho-rw)/((1+rho)*(1-tau))) )/(delt+rho))^(1/(1-alph)); //Modified
ig = delt*k;
y = x*k^alph;
c = y - ig - g - rw*d;
s = c^(-gam);
r = rho;
v = (1+rho)^(-1)*(r-rw)*c^(-gam);
dl = ds*y;
dgap = 0;
z = rho - rw;
end;

// Save the SS values (order: y d c r ig s k v dgap z)
steady;
yss0 = oo_.steady_state(1,1);
dss0 = oo_.steady_state(2,1);
css0 = oo_.steady_state(3,1);
rss0 = oo_.steady_state(4,1);
igss0 = oo_.steady_state(5,1);
sss0 = oo_.steady_state(6,1);
kss0 = oo_.steady_state(7,1);

// Check the Blanchard-Kahn conditions
check;

// Set the new steady state
endval;
x = 1;
eps_dc = 0;
tau = 0.2; // 0.15 in tax cut runs
k = (x*alph*(1-tau)*(1 + (ds*(rho-rw)/((1+rho)*(1-tau))) )/(delt+rho))^(1/(1-alph)); //Modified
ig = delt*k;
y = x*k^alph;
c = y - ig - g - rw*d;
s = c^(-gam);
r = rho;
v = (1+rho)^(-1)*(r-rw)*c^(-gam);
dl = ds*y;
dgap = 0;
z = rho - rw;
end;

// Tie down the new SS
steady;

shocks;
// 0.25 is debt cancellation value
var eps_dc; periods 1; values 0.25; end; 

// JNF uses this command, which seems to generate the same output:
// simul(periods=200); 

// Prepare the deterministic simulation of the model over 200 periods
perfect_foresight_setup(periods=200);

// Perform the simulation
perfect_foresight_solver;

send_endogenous_variables_to_workspace;


// Transform the variables y d c r ig s k v dgap z
Y = 100*(log(y) - log(yss0));
D = 100*(log(d) - log(dss0));
C = 100*(log(c) - log(css0));
R = 100*(r - rss0);
I = 100*(log(ig) - log(igss0));
S = 100*(log(s) - log(sss0));
K = 100*(log(k) - log(kss0));

// Display the path of the 5 endogenous variables (w/ period 1 as period 0)
t=tiledlayout(3,2);
nexttile; plot(C(1:25,1)); title("Consumption"); //rplot c;
nexttile; plot(I(1:25,1)); title("Gross Investment"); //rplot k;
nexttile; plot(K(1:25,1)); title("Capital stock"); //rplot i;
nexttile; plot(Y(1:25,1)); title("Output"); //rplot r;
nexttile; plot(R(1:25,1)); title("Real interest rate"); //rplot s;
nexttile; plot(D(1:25,1)); title("External Debt"); //rplot d;
title(t,'Response to shock(s)');

// Issue these commands interactively to show the forcing variables:
// rplot tau;
// rplot rho;
// rplot eps_dc;

// Save outputs as a matrix in order to compare runs
// Order y d c r ig s k v dgap z;

// This block gathers results from alternative experiments:
// Set exper = 1 below for debt relief only. Set eps_cd=0.4 in shocks 
//   block, and keep tau the same (= 0.3) in the initval and endval blocks. 
// Set exper = 2 for tax cut only. Set eps_cd=0 in the shocks block and 
//   tau=0.2 in the endval block.
// Set exper = 3 for both: Set eps_cd = 0.4 in shocks block and tau=0.2 in 
//   endval block.
// Then the results can be passed to a graphing program in Matlab.

// To do a 6-variable graph across the three experiments for a given debt
// limit, run this program for exper=1 through exper=3 and then run
// plots_jul5_2020.m.
//
// To do a 6-variable graph across the three debt limits for a given policy
// experiment, run this program, debtrelief_ylim_jul8_2020.mod and 
// debtrelief_klim_jul11_2020.mod for a given value of exper, and then run
// plots_jul22_2020.m for that value of exper.

exper = 1;

if exper == 1;
  // save just_dshock Y D C R I S K v dgap z;
  save just_dshock_ylim Y D C R I S K v dgap z;
elseif exper == 2;
  // save just_policy Y D C R I S K v dgap z;
  save just_policy_ylim Y D C R I S K v dgap z;
else;
  // save dshock_policy Y D C R I S K v dgap z;
  save dshock_policy_ylim Y D C R I S K v dgap z;
end;