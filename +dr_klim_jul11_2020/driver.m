%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clearvars -global
clear_persistent_variables(fileparts(which('dynare')), false)
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info
options_ = [];
M_.fname = 'dr_klim_jul11_2020';
M_.dynare_version = '6.1';
oo_.dynare_version = '6.1';
options_.dynare_version = '6.1';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(3,1);
M_.exo_names_tex = cell(3,1);
M_.exo_names_long = cell(3,1);
M_.exo_names(1) = {'x'};
M_.exo_names_tex(1) = {'x'};
M_.exo_names_long(1) = {'x'};
M_.exo_names(2) = {'tau'};
M_.exo_names_tex(2) = {'tau'};
M_.exo_names_long(2) = {'tau'};
M_.exo_names(3) = {'eps_dc'};
M_.exo_names_tex(3) = {'eps\_dc'};
M_.exo_names_long(3) = {'eps_dc'};
M_.endo_names = cell(12,1);
M_.endo_names_tex = cell(12,1);
M_.endo_names_long = cell(12,1);
M_.endo_names(1) = {'y'};
M_.endo_names_tex(1) = {'y'};
M_.endo_names_long(1) = {'y'};
M_.endo_names(2) = {'d'};
M_.endo_names_tex(2) = {'d'};
M_.endo_names_long(2) = {'d'};
M_.endo_names(3) = {'c'};
M_.endo_names_tex(3) = {'c'};
M_.endo_names_long(3) = {'c'};
M_.endo_names(4) = {'r'};
M_.endo_names_tex(4) = {'r'};
M_.endo_names_long(4) = {'r'};
M_.endo_names(5) = {'ig'};
M_.endo_names_tex(5) = {'ig'};
M_.endo_names_long(5) = {'ig'};
M_.endo_names(6) = {'s'};
M_.endo_names_tex(6) = {'s'};
M_.endo_names_long(6) = {'s'};
M_.endo_names(7) = {'k'};
M_.endo_names_tex(7) = {'k'};
M_.endo_names_long(7) = {'k'};
M_.endo_names(8) = {'v'};
M_.endo_names_tex(8) = {'v'};
M_.endo_names_long(8) = {'v'};
M_.endo_names(9) = {'dgap'};
M_.endo_names_tex(9) = {'dgap'};
M_.endo_names_long(9) = {'dgap'};
M_.endo_names(10) = {'z'};
M_.endo_names_tex(10) = {'z'};
M_.endo_names_long(10) = {'z'};
M_.endo_names(11) = {'dl'};
M_.endo_names_tex(11) = {'dl'};
M_.endo_names_long(11) = {'dl'};
M_.endo_names(12) = {'AUX_EXO_LEAD_61'};
M_.endo_names_tex(12) = {'AUX\_EXO\_LEAD\_61'};
M_.endo_names_long(12) = {'AUX_EXO_LEAD_61'};
M_.endo_partitions = struct();
M_.param_names = cell(9,1);
M_.param_names_tex = cell(9,1);
M_.param_names_long = cell(9,1);
M_.param_names(1) = {'alph'};
M_.param_names_tex(1) = {'alph'};
M_.param_names_long(1) = {'alph'};
M_.param_names(2) = {'gam'};
M_.param_names_tex(2) = {'gam'};
M_.param_names_long(2) = {'gam'};
M_.param_names(3) = {'delt'};
M_.param_names_tex(3) = {'delt'};
M_.param_names_long(3) = {'delt'};
M_.param_names(4) = {'rho'};
M_.param_names_tex(4) = {'rho'};
M_.param_names_long(4) = {'rho'};
M_.param_names(5) = {'mu'};
M_.param_names_tex(5) = {'mu'};
M_.param_names_long(5) = {'mu'};
M_.param_names(6) = {'g'};
M_.param_names_tex(6) = {'g'};
M_.param_names_long(6) = {'g'};
M_.param_names(7) = {'rw'};
M_.param_names_tex(7) = {'rw'};
M_.param_names_long(7) = {'rw'};
M_.param_names(8) = {'taubase'};
M_.param_names_tex(8) = {'taubase'};
M_.param_names_long(8) = {'taubase'};
M_.param_names(9) = {'dk'};
M_.param_names_tex(9) = {'dk'};
M_.param_names_long(9) = {'dk'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 3;
M_.endo_nbr = 12;
M_.param_nbr = 9;
M_.orig_endo_nbr = 11;
M_.aux_vars(1).endo_index = 12;
M_.aux_vars(1).type = 2;
M_.aux_vars(1).orig_expr = 'x';
M_.Sigma_e = zeros(3, 3);
M_.Correlation_matrix = eye(3, 3);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
M_.surprise_shocks = [];
M_.learnt_shocks = [];
M_.learnt_endval = [];
M_.heteroskedastic_shocks.Qvalue_orig = [];
M_.heteroskedastic_shocks.Qscale_orig = [];
M_.matched_irfs = {};
M_.matched_irfs_weights = {};
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.ramsey_policy = false;
options_.discretionary_policy = false;
M_.eq_nbr = 12;
M_.ramsey_orig_eq_nbr = 0;
M_.ramsey_orig_endo_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 1;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 3 0;
 1 4 0;
 0 5 15;
 0 6 0;
 0 7 16;
 0 8 17;
 2 9 0;
 0 10 0;
 0 11 0;
 0 12 0;
 0 13 0;
 0 14 18;]';
M_.nstatic = 6;
M_.nfwrd   = 4;
M_.npred   = 2;
M_.nboth   = 0;
M_.nsfwrd   = 4;
M_.nspred   = 2;
M_.ndynamic   = 6;
M_.dynamic_tmp_nbr = [9; 2; 0; 0; ];
M_.equations_tags = {
  1 , 'name' , 'y' ;
  2 , 'name' , 'd' ;
  3 , 'name' , '3' ;
  4 , 'name' , 'ig' ;
  5 , 'name' , 's' ;
  6 , 'name' , 'k' ;
  7 , 'name' , 'v' ;
  8 , 'name' , 'dl' ;
  9 , 'name' , 'dgap' ;
  10 , 'name' , '10' ;
  11 , 'name' , 'z' ;
};
M_.mapping.y.eqidx = [1 2 ];
M_.mapping.d.eqidx = [2 9 ];
M_.mapping.c.eqidx = [2 3 4 5 ];
M_.mapping.r.eqidx = [3 7 11 ];
M_.mapping.ig.eqidx = [2 4 5 6 ];
M_.mapping.s.eqidx = [4 5 7 ];
M_.mapping.k.eqidx = [1 4 5 6 8 ];
M_.mapping.v.eqidx = [5 7 10 ];
M_.mapping.dgap.eqidx = [9 10 ];
M_.mapping.z.eqidx = [11 ];
M_.mapping.dl.eqidx = [8 9 ];
M_.mapping.x.eqidx = [1 5 ];
M_.mapping.tau.eqidx = [5 ];
M_.mapping.eps_dc.eqidx = [2 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.block_structure.time_recursive = false;
M_.block_structure.block(1).Simulation_Type = 1;
M_.block_structure.block(1).endo_nbr = 1;
M_.block_structure.block(1).mfs = 1;
M_.block_structure.block(1).equation = [ 12];
M_.block_structure.block(1).variable = [ 12];
M_.block_structure.block(1).is_linear = true;
M_.block_structure.block(1).NNZDerivatives = 1;
M_.block_structure.block(1).bytecode_jacob_cols_to_sparse = [2 ];
M_.block_structure.block(2).Simulation_Type = 8;
M_.block_structure.block(2).endo_nbr = 10;
M_.block_structure.block(2).mfs = 9;
M_.block_structure.block(2).equation = [ 8 5 7 10 1 6 9 2 3 4];
M_.block_structure.block(2).variable = [ 11 8 4 9 1 7 2 5 3 6];
M_.block_structure.block(2).is_linear = false;
M_.block_structure.block(2).NNZDerivatives = 32;
M_.block_structure.block(2).bytecode_jacob_cols_to_sparse = [5 6 0 10 11 12 13 14 15 16 17 18 25 26 27 ];
M_.block_structure.block(3).Simulation_Type = 1;
M_.block_structure.block(3).endo_nbr = 1;
M_.block_structure.block(3).mfs = 1;
M_.block_structure.block(3).equation = [ 11];
M_.block_structure.block(3).variable = [ 10];
M_.block_structure.block(3).is_linear = true;
M_.block_structure.block(3).NNZDerivatives = 1;
M_.block_structure.block(3).bytecode_jacob_cols_to_sparse = [2 ];
M_.block_structure.block(1).g1_sparse_rowval = int32([]);
M_.block_structure.block(1).g1_sparse_colval = int32([]);
M_.block_structure.block(1).g1_sparse_colptr = int32([]);
M_.block_structure.block(2).g1_sparse_rowval = int32([4 5 9 7 1 2 3 2 8 3 6 4 7 1 5 6 6 7 5 7 9 7 8 9 1 9 1 1 8 1 2 ]);
M_.block_structure.block(2).g1_sparse_colval = int32([5 5 5 6 10 10 10 11 11 12 12 13 13 14 14 14 15 15 16 16 16 17 17 17 18 18 25 26 26 27 27 ]);
M_.block_structure.block(2).g1_sparse_colptr = int32([1 1 1 1 1 4 5 5 5 5 8 10 12 14 17 19 22 25 27 27 27 27 27 27 27 28 30 32 ]);
M_.block_structure.block(3).g1_sparse_rowval = int32([]);
M_.block_structure.block(3).g1_sparse_colval = int32([]);
M_.block_structure.block(3).g1_sparse_colptr = int32([]);
M_.block_structure.variable_reordered = [ 12 11 8 4 9 1 7 2 5 3 6 10];
M_.block_structure.equation_reordered = [ 12 8 5 7 10 1 6 9 2 3 4 11];
M_.block_structure.incidence(1).lead_lag = -1;
M_.block_structure.incidence(1).sparse_IM = [
 1 7;
 2 2;
 4 7;
 6 7;
];
M_.block_structure.incidence(2).lead_lag = 0;
M_.block_structure.incidence(2).sparse_IM = [
 1 1;
 2 1;
 2 2;
 2 3;
 2 5;
 3 3;
 3 4;
 4 3;
 4 5;
 4 6;
 5 6;
 5 7;
 5 8;
 6 5;
 6 7;
 7 4;
 7 8;
 8 7;
 8 11;
 9 2;
 9 9;
 9 11;
 10 8;
 10 9;
 11 4;
 11 10;
 12 12;
];
M_.block_structure.incidence(3).lead_lag = 1;
M_.block_structure.incidence(3).sparse_IM = [
 3 3;
 5 3;
 5 5;
 5 6;
 5 12;
 7 6;
];
M_.block_structure.dyn_tmp_nbr = 8;
M_.state_var = [7 2 ];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(12, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(3, 1);
M_.params = NaN(9, 1);
M_.endo_trends = struct('deflator', cell(12, 1), 'log_deflator', cell(12, 1), 'growth_factor', cell(12, 1), 'log_growth_factor', cell(12, 1));
M_.NNZDerivatives = [41; -1; -1; ];
M_.dynamic_g1_sparse_rowval = int32([2 1 4 6 1 2 2 9 2 3 4 3 7 11 2 4 6 4 5 5 6 8 5 7 10 9 10 11 8 9 12 3 5 5 5 7 5 1 12 5 2 ]);
M_.dynamic_g1_sparse_colval = int32([2 7 7 7 13 13 14 14 15 15 15 16 16 16 17 17 17 18 18 19 19 19 20 20 20 21 21 22 23 23 24 27 27 29 30 30 36 37 37 38 39 ]);
M_.dynamic_g1_sparse_colptr = int32([1 1 2 2 2 2 2 5 5 5 5 5 5 7 9 12 15 18 20 23 26 28 29 31 32 32 32 34 34 35 37 37 37 37 37 37 38 40 41 42 ]);
M_.lhs = {
'y'; 
'd'; 
'c^(-gam)'; 
'ig'; 
's'; 
'k'; 
'v'; 
'dl'; 
'dgap'; 
'dgap'; 
'z'; 
'AUX_EXO_LEAD_61'; 
};
M_.static_tmp_nbr = [7; 1; 0; 0; ];
M_.block_structure_stat.block(1).Simulation_Type = 1;
M_.block_structure_stat.block(1).endo_nbr = 1;
M_.block_structure_stat.block(1).mfs = 1;
M_.block_structure_stat.block(1).equation = [ 12];
M_.block_structure_stat.block(1).variable = [ 12];
M_.block_structure_stat.block(2).Simulation_Type = 6;
M_.block_structure_stat.block(2).endo_nbr = 10;
M_.block_structure_stat.block(2).mfs = 10;
M_.block_structure_stat.block(2).equation = [ 2 3 4 5 6 7 8 9 10 1];
M_.block_structure_stat.block(2).variable = [ 2 4 3 7 5 6 11 9 8 1];
M_.block_structure_stat.block(3).Simulation_Type = 1;
M_.block_structure_stat.block(3).endo_nbr = 1;
M_.block_structure_stat.block(3).mfs = 1;
M_.block_structure_stat.block(3).equation = [ 11];
M_.block_structure_stat.block(3).variable = [ 10];
M_.block_structure_stat.variable_reordered = [ 12 2 4 3 7 5 6 11 9 8 1 10];
M_.block_structure_stat.equation_reordered = [ 12 2 3 4 5 6 7 8 9 10 1 11];
M_.block_structure_stat.incidence.sparse_IM = [
 1 1;
 1 7;
 2 1;
 2 2;
 2 3;
 2 5;
 3 3;
 3 4;
 4 3;
 4 5;
 4 6;
 4 7;
 5 3;
 5 5;
 5 6;
 5 7;
 5 8;
 5 12;
 6 5;
 6 7;
 7 4;
 7 6;
 7 8;
 8 7;
 8 11;
 9 2;
 9 9;
 9 11;
 10 8;
 10 9;
 11 4;
 11 10;
 12 12;
];
M_.block_structure_stat.tmp_nbr = 6;
M_.block_structure_stat.block(1).g1_sparse_rowval = int32([]);
M_.block_structure_stat.block(1).g1_sparse_colval = int32([]);
M_.block_structure_stat.block(1).g1_sparse_colptr = int32([]);
M_.block_structure_stat.block(2).g1_sparse_rowval = int32([1 8 2 6 1 2 3 4 3 4 5 7 10 1 3 4 5 3 4 6 7 8 8 9 4 6 9 1 10 ]);
M_.block_structure_stat.block(2).g1_sparse_colval = int32([1 1 2 2 3 3 3 3 4 4 4 4 4 5 5 5 5 6 6 6 7 7 8 8 9 9 9 10 10 ]);
M_.block_structure_stat.block(2).g1_sparse_colptr = int32([1 3 5 9 14 18 21 23 25 28 30 ]);
M_.block_structure_stat.block(3).g1_sparse_rowval = int32([]);
M_.block_structure_stat.block(3).g1_sparse_colval = int32([]);
M_.block_structure_stat.block(3).g1_sparse_colptr = int32([]);
M_.static_g1_sparse_rowval = int32([1 2 2 9 2 3 4 5 3 7 11 2 4 5 6 4 5 7 1 4 5 6 8 5 7 10 9 10 11 8 9 5 12 ]);
M_.static_g1_sparse_colval = int32([1 1 2 2 3 3 3 3 4 4 4 5 5 5 5 6 6 6 7 7 7 7 7 8 8 8 9 9 10 11 11 12 12 ]);
M_.static_g1_sparse_colptr = int32([1 3 5 9 12 16 19 24 27 29 30 32 34 ]);
M_.params(1) = 0.33;
alph = M_.params(1);
M_.params(2) = 2;
gam = M_.params(2);
M_.params(3) = 0.2;
delt = M_.params(3);
M_.params(4) = 0.07;
rho = M_.params(4);
M_.params(5) = 0.5;
mu = M_.params(5);
M_.params(6) = 0.15;
g = M_.params(6);
M_.params(7) = 0.05;
rw = M_.params(7);
M_.params(8) = 0.20;
taubase = M_.params(8);
M_.params(9) = 0.4*(M_.params(4)+M_.params(3))/((1-M_.params(8))*M_.params(1)+0.4*(M_.params(4)-M_.params(7)));
dk = M_.params(9);
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.exo_steady_state(1) = 1;
oo_.exo_steady_state(3) = 0;
oo_.exo_steady_state(2) = 0.20;
oo_.steady_state(7) = (M_.params(1)*oo_.exo_steady_state(1)*(1-oo_.exo_steady_state(2))/(M_.params(4)+M_.params(3)-(M_.params(4)-M_.params(7))*M_.params(9)))^(1/(1-M_.params(1)));
oo_.steady_state(5) = M_.params(3)*oo_.steady_state(7);
oo_.steady_state(1) = oo_.exo_steady_state(1)*oo_.steady_state(7)^M_.params(1);
oo_.steady_state(3) = oo_.steady_state(1)-oo_.steady_state(5)-M_.params(6)-M_.params(7)*oo_.steady_state(2);
oo_.steady_state(6) = oo_.steady_state(3)^(-M_.params(2));
oo_.steady_state(4) = M_.params(4);
oo_.steady_state(8) = oo_.steady_state(3)^(-M_.params(2))*(1+M_.params(4))^(-1)*(oo_.steady_state(4)-M_.params(7));
oo_.steady_state(11) = M_.params(9)*oo_.steady_state(7);
oo_.steady_state(9) = 0;
oo_.steady_state(10) = M_.params(4)-M_.params(7);
oo_.steady_state(12)=oo_.exo_steady_state(1);
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
steady;
yss0 = oo_.steady_state(1,1);
dss0 = oo_.steady_state(2,1);
css0 = oo_.steady_state(3,1);
rss0 = oo_.steady_state(4,1);
igss0 = oo_.steady_state(5,1);
sss0 = oo_.steady_state(6,1);
kss0 = oo_.steady_state(7,1);
oo_.dr.eigval = check(M_,options_,oo_);
%
% ENDVAL instructions
%
oo_.initial_steady_state = oo_.steady_state;
oo_.initial_exo_steady_state = oo_.exo_steady_state;
oo_.exo_steady_state(1) = 1;
oo_.exo_steady_state(3) = 0;
oo_.exo_steady_state(2) = 0.15;
oo_.steady_state(7) = (M_.params(1)*oo_.exo_steady_state(1)*(1-oo_.exo_steady_state(2))/(M_.params(4)+M_.params(3)-(M_.params(4)-M_.params(7))*M_.params(9)))^(1/(1-M_.params(1)));
oo_.steady_state(5) = M_.params(3)*oo_.steady_state(7);
oo_.steady_state(1) = oo_.exo_steady_state(1)*oo_.steady_state(7)^M_.params(1);
oo_.steady_state(3) = oo_.steady_state(1)-oo_.steady_state(5)-M_.params(6)-M_.params(7)*oo_.steady_state(2);
oo_.steady_state(6) = oo_.steady_state(3)^(-M_.params(2));
oo_.steady_state(4) = M_.params(4);
oo_.steady_state(8) = oo_.steady_state(3)^(-M_.params(2))*(1+M_.params(4))^(-1)*(oo_.steady_state(4)-M_.params(7));
oo_.steady_state(11) = M_.params(9)*oo_.steady_state(7);
oo_.steady_state(9) = 0;
oo_.steady_state(10) = M_.params(4)-M_.params(7);
oo_.steady_state(12)=oo_.exo_steady_state(1);
steady;
%
% SHOCKS instructions
%
M_.det_shocks = [ M_.det_shocks;
struct('exo_det',false,'exo_id',3,'type','level','periods',1:1,'value',0.25) ];
M_.exo_det_length = 0;
options_.periods = 200;
oo_ = perfect_foresight_setup(M_, options_, oo_);
[oo_, Simulated_time_series] = perfect_foresight_solver(M_, options_, oo_);
send_endogenous_variables_to_workspace;
Y = 100*(log(y) - log(yss0));
D = 100*(log(d) - log(dss0));
C = 100*(log(c) - log(css0));
R = 100*(r - rss0);
I = 100*(log(ig) - log(igss0));
S = 100*(log(s) - log(sss0));
K = 100*(log(k) - log(kss0));
t=tiledlayout(3,2);
nexttile; plot(C(1:25,1)); title("Consumption"); 
nexttile; plot(I(1:25,1)); title("Gross Investment"); 
nexttile; plot(K(1:25,1)); title("Capital stock"); 
nexttile; plot(Y(1:25,1)); title("Output"); 
nexttile; plot(R(1:25,1)); title("Real interest rate"); 
nexttile; plot(D(1:25,1)); title("External Debt"); 
title(t,'Response to shock(s)');
exper = 3;
if exper == 1;
save just_dshock Y D C R I S K v dgap z;
save just_dshock_klim Y D C R I S K v dgap z;
elseif exper == 2;
save just_policy Y D C R I S K v dgap z;
save just_policy_klim Y D C R I S K v dgap z;
else;
save dshock_policy Y D C R I S K v dgap z;
save dshock_policy_klim Y D C R I S K v dgap z;
end;


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'dr_klim_jul11_2020_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'dr_klim_jul11_2020_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'dr_klim_jul11_2020_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'dr_klim_jul11_2020_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'dr_klim_jul11_2020_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'dr_klim_jul11_2020_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'dr_klim_jul11_2020_results.mat'], 'oo_recursive_', '-append');
end
if exist('options_mom_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'dr_klim_jul11_2020_results.mat'], 'options_mom_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
