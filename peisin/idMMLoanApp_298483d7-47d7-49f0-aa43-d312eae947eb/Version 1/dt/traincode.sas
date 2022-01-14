*------------------------------------------------------------*;
* Macro Variables for input, output data and files;
  %let dm_datalib       =;                 /* Libref associated with the CAS training table */
  %let dm_output_lib    = &dm_datalib;     /* Libref associated with the output CAS tables */
  %let dm_data_caslib   =;                 /* CASLIB associated with the training table */
  %let dm_output_caslib = &dm_data_caslib; /* CASLIB associated with the output tables */
  %let dm_memName= ;    /* Training Table name */
  %let dm_memnameNlit = %sysfunc(nliteral(&dm_memname));
  %let dm_lib     = WORK;
  %let dm_folder  = %sysfunc(pathname(work));
*------------------------------------------------------------*;
*------------------------------------------------------------*;
  * Training for tree;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
  * Initializing Variable Macros;
*------------------------------------------------------------*;
%macro dm_unary_input;
%mend dm_unary_input;
%global dm_num_unary_input;
%let dm_num_unary_input = 0;
%macro dm_interval_input;
'CredLineAge'n 'CredLines'n 'DebtIncRatio'n 'HomeValue'n 'Income'n
'LoanRequest'n 'LoanToValue'n 'YearsOnJob'n
%mend dm_interval_input;
%global dm_num_interval_input;
%let dm_num_interval_input = 8 ;
%macro dm_binary_input;
%mend dm_binary_input;
%global dm_num_binary_input;
%let dm_num_binary_input = 0;
%macro dm_nominal_input;
'Delinquencies'n 'DerogatoryMarks'n 'Inquiries'n 'JobType'n
%mend dm_nominal_input;
%global dm_num_nominal_input;
%let dm_num_nominal_input = 4 ;
%macro dm_ordinal_input;
%mend dm_ordinal_input;
%global dm_num_ordinal_input;
%let dm_num_ordinal_input = 0;
%macro dm_class_input;
'Delinquencies'n 'DerogatoryMarks'n 'Inquiries'n 'JobType'n
%mend dm_class_input;
%global dm_num_class_input;
%let dm_num_class_input = 4 ;
%macro dm_segment;
%mend dm_segment;
%global dm_num_segment;
%let dm_num_segment = 0;
%macro dm_id;
'CustomerID'n
%mend dm_id;
%global dm_num_id;
%let dm_num_id = 1 ;
%macro dm_text;
%mend dm_text;
%global dm_num_text;
%let dm_num_text = 0;
%macro dm_strat_vars;
'Default'n
%mend dm_strat_vars;
%global dm_num_strat_vars;
%let dm_num_strat_vars = 1 ;
*------------------------------------------------------------*;
  * Initializing Macro Variables *;
*------------------------------------------------------------*;
  %let dm_data_outfit = &dm_lib..outfit;
  %let dm_file_scorecode = &dm_folder/scorecode.sas;
  %let dm_caslibOption =;
  data _null_;
     if index(symget('dm_data_caslib'), '(') or index(symget('dm_data_caslib'), ')' ) or (symget('dm_data_caslib')=' ') then do;
        call symput('dm_caslibOption', ' ');
     end;
     else do;
        call symput('dm_caslibOption', 'caslib="'!!ktrim(symget('dm_data_caslib'))!!'"');
     end;
  run;


*------------------------------------------------------------*;
  * Component Code;
*------------------------------------------------------------*;
proc treesplit data=&dm_datalib..&dm_memnameNlit(&dm_caslibOption)
     maxdepth=10 numbin=50 minleafsize=5
     nsurrogates=1 maxbranch=2 assignmissing=USEINSEARCH binmethod=QUANTILE nomsearch(maxcategories=128)
     minuseinsearch=1
     pruningtable
     outmodel=&dm_output_lib.._43V6H5PPKK31A6TVHHTK200AN_model treeplot printtarget;
  grow IGR
  ;
  target 'Default'n / level=nominal;
  input %dm_interval_input / level=interval;
  input %dm_binary_input %dm_nominal_input %dm_ordinal_input %dm_unary_input / level=nominal;
  partition rolevar='_PartInd_'n (TRAIN='1' VALIDATE='0' TEST='2');
  prune costcomplexity;
  code file="&dm_file_scorecode." nocomppgm labelid=25082634;
  ods output
     CostComplexity = &dm_lib..pruning
     VariableImportance = &dm_lib..varimportance(drop=std) TreePlotTable = &dm_lib..treeplot TreePerformance = &dm_lib..TreePerf
     PredProbName = &dm_lib..PredProbName
     PredIntoName = &dm_lib..PredIntoName
  ;
  ods exclude treeplottable OutputCasTables;
run;
