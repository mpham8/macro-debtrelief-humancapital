/* debt_relief_may_2024.mod [Dynare model file]
 * Based on dr_klim_h_rho_jul29_2020_m.docx
 * Incorporates human capital externality, fixed model equation errors
 * By Steve O'Connell, May 24, 2024.
 *
 * This file incorporates human K a la Barro, Mankiw and Sala-i-Martin 1995,
 * into a model with a debt limit D < dk*K.
 * BMS assumed no impatience, whereas we impose rho > r*.
 *
 * Based on debtrelief_klim_jul11_2020.mod. A few modifications/fixes:
 * --Incorporates g=0.15=gov't share of spending, rather than fixing gov't
 * spending as a parameter.
 * --Sets taubase = 0.20 as a parameter so that the calculation of dk
 * comes from a baseline SS with D = dk*K and D = 0.4*Y.
 *
 * When running the 3 experiments: each time, >>clear and then run dynare.
*/


// Endogenous variables
var y d c r ikg sk k ihg sh h v dgap z dl htok a;


// Exogenous variable: TFP, tax rate on GDP, debt cancellation
varexo b tau rho eps_dc;


// Parameters declaration and calibration
parameters alphak alphah gam delt mu g rw taubase dk phi;
alphak=0.33;  //physical capital share, JNF = 0.5
alphah=0.33;  //human capital share
gam=2;        //relative risk aversion, JNF = 1/0.34
delt=0.2;     //depreciation rate, JNF = 0.3, still way too high
mu=0.5;       //adjustment cost parameter, JNF = 0.517
g=0.15;       //government spending as share of GDP, JNF = 0.05 in absolute terms
rw=0.05;      //world interest rate < rho, JNF = 0.04
taubase=0.20; //baseline tax rate
//The next parameter yields D = 0.4*Y in baseline SS
dk = 0.4*(rho+delt)/((1-taubase)*alphak + 0.4*(rho-rw));
phi = 0.1;        //human capital externality wedge


// Equilibrium conditions:
model;
   // 1. Production function
y = a*k(-1)^alphak*h(-1)^(alphah-phi);
   // 2. Resource constraint with gov't spending = g*y
d = d(-1) + rw*d(-1) + c + ikg + ihg + g*y - y - eps_dc; 
   // 3. Euler equation
c^(-gam) = (1+rho)^(-1)*(1+r)*c(+1)^(-gam); 
   // 4. Investment function for physical capital
ikg = k(-1)* (delt + (1/mu)*(1-(c^(-gam)/sk)));
   // 5. Shadow price on capital, modified for endogenous debt limit
sk = dk*v + (1+rho)^(-1)*( c(+1)^(-gam)*(1-tau)*alphak*b(+1)*k^(alphak-1)*h^alphah
  + sk(+1)*(1 - delt + (mu/2)*((ikg(+1)/k)^2-delt^2)) );
   // 6. Dynamics of physical capital stock
k = (1-delt)*k(-1) + ikg - (mu/2)*(((ikg/k(-1))-delt)^2)*k(-1);
   // 7. Investment function for human capital
ihg = h(-1)*(delt + (1/mu)*(1-(c^(-gam)/sh)));
   // 8. Shadow price on human capital
sh = (1+rho)^(-1)*( c(+1)^(-gam)*(1-tau)*(alphah-phi)*b(+1)*k^alphak*h^(alphah-1)
  + sh(+1)*(1 - delt + (mu/2)*((ihg(+1)/h)^2-delt^2)) );
   // 9. Dynamics of human capital stock
h = (1-delt)*h(-1) + ihg - (mu/2)*(((ihg/h(-1))-delt)^2)*h(-1);
   // 10. Shadow price on borrowing constraint
v = (1+rho)^(-1)*(r - rw)*c(+1)^(-gam);
   // 11. Debt limit
dl = dk*k;
   // 12. and 13. Complementary slackness
dgap = dl - d;
dgap = max(0,dgap - v); 
   // 14. Interest-rate spread
z = r - rw;
   // 15. Ratio of capital stocks
htok = h/k;
   // 16. Total Factor Productivity
a = b*h(-1)^phi;
end;


// Steady state (analytically solved)
initval;
b = 1;
eps_dc = 0;
rho=0.07;    //rate of time preference, JNF = 0.05
tau = 0.20;
a = b*h^phi;
k = ( (b*(1-tau)*alphak^(1-alphah)*(alphah-phi)^alphah)/((delt+rho-dk*(rho-rw))^(1-alphah)*(delt+rho)^alphah) )^(1/(1-alphak-alphah-phi));
h = ((alphah-phi)/alphak)*((delt+rho-dk*(rho-rw))/(delt+rho))*k;
y = b*k^alphak*h^alphah;
ikg = delt*k;
ihg = delt*h;
c = y - ikg - ihg - g*y - rw*d;
sk = c^(-gam);
sh = c^(-gam);
r = rho;
v = (1+rho)^(-1)*(r-rw)*c^(-gam);
dl = dk*k;
d = dl;  // Needs to be added to the other programs, in principle!
dgap = 0;
z = rho - rw;
htok = h/k;
end;


// Save the SS values (order: y d c r ikg sk k ihg sh h v dgap z dl htok)
steady;


yss0 = oo_.steady_state(1,1);
dss0 = oo_.steady_state(2,1);
css0 = oo_.steady_state(3,1);
rss0 = oo_.steady_state(4,1);
ikgss0 = oo_.steady_state(5,1);
skss0 = oo_.steady_state(6,1);
kss0 = oo_.steady_state(7,1);
ihgss0 = oo_.steady_state(8,1);
shss0 = oo_.steady_state(9,1);
hss0 = oo_.steady_state(10,1);
htokss0 = oo_.steady_state(15,1);


// Check the Blanchard-Kahn conditions
check;


// Set the new steady state
endval;
b = 1;
eps_dc = 0;
rho=0.07;    // 0.07 in baseline and 0.06 when policy reform=cut in disc rate
tau = 0.2;  // 0.20 in baseline and 0.15 when policy reform=tax cut
a = b*h^phi; 
k = ( (b*(1-tau)*alphak^(1-alphah)*(alphah-phi)^alphah)/((delt+rho-dk*(rho-rw))^(1-alphah)*(delt+rho)^alphah) )^(1/(1-alphak-alphah-phi));
h = ((alphah-phi)/alphak)*((delt+rho-dk*(rho-rw))/(delt+rho))*k;
ihg = delt*h;
y = b*k^alphak*h^alphah;
c = y - ikg -ihg - g*y - rw*d;
sk = c^(-gam);
sh = c^(-gam);
r = rho;
v = (1+rho)^(-1)*(r-rw)*c^(-gam);
dl = dk*k;
d = dl; //Needs to be added to the other programs, in principle!
dgap = 0;
z = rho - rw;
end;


// Tie down new SS
steady;


shocks;
// 0.25 is debt cancellation value
var eps_dc; 
periods 1; 
values 0.25; 
end; 


// Prepare the deterministic simulation of the model over 200 periods
perfect_foresight_setup(periods=200);


// Perform the simulation
perfect_foresight_solver;

send_endogenous_variables_to_workspace;

// Transform the variables y d c r ikg sk k ihg sh h v dgap z dl htok
Y = 100*(log(y) - log(yss0));
D = 100*(log(d) - log(dss0));
C = 100*(log(c) - log(css0));
R = 100*(r - rss0);
IK = 100*(log(ikg) - log(ikgss0));
SK = 100*(log(sk) - log(skss0));
K = 100*(log(k) - log(kss0));
IH = 100*(log(ihg) - log(ihgss0));
SH = 100*(log(sh) - log(shss0));
H = 100*(log(h) - log(hss0));
HTOK = 100*(log(htok) - log(htokss0));


// Display the path of the 5 endogenous variables (w/ period 1 as period 0)
// This is alternative to a list of "rplot x" commands.
t=tiledlayout(3,3);
nexttile; plot(C(1:25,1)); title("Consumption"); 
nexttile; plot(IK(1:25,1)); title("Gross K investment");
nexttile; plot(IH(1:25,1)); title("Gross H investment"); 
nexttile; plot(K(1:25,1)); title("Capital stock");
nexttile; plot(H(1:25,1)); title("Human capital stock"); 
nexttile; plot(Y(1:25,1)); title("Output");
nexttile; plot(R(1:25,1)); title("Real interest rate");
nexttile; plot(D(1:25,1)); title("External debt");
nexttile; plot(HTOK(1:25,1)); title("Ratio of H to K");
title(t,'Response to shock(s)');


// Issue these commands interactively to show the forcing variables:
// rplot tau;
// rplot rho;
// rplot eps_dc;


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
  save just_dshock_h Y D C R IK SK K IH SH H v dgap z HTOK;
//  save just_dshock_h_klim Y D C R IK SK K IH SH H v dgap z HTOK;
elseif exper == 2;
  save just_policy_h Y D C R IK SK K IH SH H v dgap z HTOK;
//  save just_policy_h_klim Y D C R IK SK K IH SH H v dgap z HTOK;
else;
  save dshock_policy_h Y D C R IK SK K IH SH H v dgap z HTOK;
//  save dshock_policy_h_klim Y D C R IK SK K IH SH H v dgap z HTOK;
end;