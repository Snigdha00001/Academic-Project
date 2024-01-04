    libname project "/home/u63088230/Project BAN130";
/*
proc import datafile="/home/u63053896/BAN110NAA/Project/Case_Data.csv"
			dbms=csv
			out=project.loan
			replace;
	*getnames=yes;
run;
*/

data PROJECT.LOAN    ;
%let _EFIERR_ = 0; /* set the ERROR detection macro variable */
infile '/home/u63088230/Project BAN130/Loan_Risk_Analysis_Dataset.csv' delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;
   informat Row_ID $15. ;
   informat id $15. ;
   informat member_id $15. ;
   informat loan_amnt best32. ;
   informat funded_amnt best32. ;
   informat term $9. ;
   informat int_rate best32. ;
   informat installment best32. ;
   informat grade $1. ;
   informat sub_grade $2. ;
   informat emp_title $25. ;
   informat emp_length $9. ;
   informat home_ownership $8. ;
   informat annual_inc best32. ;
   informat verification_status $15. ;
   informat issue_d $6. ;
   informat loan_status $11. ;
   informat purpose $18. ;
   informat title $23. ;
   informat dti best32. ;
   informat delinq_2yrs best32. ;
   informat earliest_cr_line $6. ;
   informat inq_last_6mths best32. ;
   informat mths_since_last_delinq best32. ;
   informat open_acc best32. ;
   informat pub_rec best32. ;
   informat revol_bal best32. ;
   informat revol_util best32. ;
   informat total_acc best32. ;
   informat initial_list_status $1. ;
   informat out_prncp best32. ;
   informat total_pymnt best32. ;
   informat total_rec_prncp best32. ;
   informat total_rec_int best32. ;
   informat total_rec_late_fee best32. ;
   informat recoveries best32. ;
   informat collection_recovery_fee best32. ;
   informat last_pymnt_d $6. ;
   informat last_pymnt_amnt best32. ;
   informat next_pymnt_d $1. ;
   informat last_credit_pull_d $6. ;
   informat collections_12_mths_ex_med best32. ;
   informat mths_since_last_major_derog best32. ;
   informat application_type $10. ;
   informat annual_inc_joint 1. ;
   informat dti_joint 1. ;
   informat acc_now_delinq best32. ;
   informat tot_coll_amt best32. ;
   informat tot_cur_bal best32. ;
   informat total_rev_hi_lim best32. ;
   informat VAR51 $1. ;
   informat Months_36 1. ;
   informat Months_60 1. ;
   format Row_ID $best12. ;
   format id $best12. ;
   format member_id $best12. ;
   format loan_amnt best12. ;
   format funded_amnt best12. ;
   format term $9. ;
   format int_rate best12. ;
   format installment best12. ;
   format grade $1. ;
   format sub_grade $2. ;
   format emp_title $25. ;
   format emp_length $9. ;
   format home_ownership $8. ;
   format annual_inc best12. ;
   format verification_status $15. ;
   format issue_d $6. ;
   format loan_status $11. ;
   format purpose $18. ;
   format title $23. ;
   format dti best12. ;
   format delinq_2yrs best12. ;
   format earliest_cr_line $6. ;
   format inq_last_6mths best12. ;
   format mths_since_last_delinq best12. ;
   format open_acc best12. ;
   format pub_rec best12. ;
   format revol_bal best12. ;
   format revol_util best12. ;
   format total_acc best12. ;
   format initial_list_status $1. ;
   format out_prncp best12. ;
   format total_pymnt best12. ;
   format total_rec_prncp best12. ;
   format total_rec_int best12. ;
   format total_rec_late_fee best12. ;
   format recoveries best12. ;
   format collection_recovery_fee best12. ;
   format last_pymnt_d $6. ;
   format last_pymnt_amnt best12. ;
   format next_pymnt_d $1. ;
   format last_credit_pull_d $6. ;
   format collections_12_mths_ex_med best12. ;
   format mths_since_last_major_derog best12. ;
   format application_type $10. ;
   format annual_inc_joint 1. ;
   format dti_joint 1. ;
   format acc_now_delinq best12. ;
   format tot_coll_amt best12. ;
   format tot_cur_bal best12. ;
   format total_rev_hi_lim best12. ;
   format VAR51 $1. ;
   format Months_36 best12. ;
   format Months_60 best12. ;
input
            Row_ID $
            id $
            member_id $
            loan_amnt
            funded_amnt
            term  $
            int_rate
            installment
            grade  $
            sub_grade  $
            emp_title  $
            emp_length  $
            home_ownership  $
            annual_inc
            verification_status  $
            issue_d  $
            loan_status  $
            purpose  $
            title  $
            dti
            delinq_2yrs
            earliest_cr_line  $
            inq_last_6mths
            mths_since_last_delinq
            open_acc
            pub_rec
            revol_bal
            revol_util
            total_acc
            initial_list_status  $
            out_prncp
            total_pymnt
            total_rec_prncp
            total_rec_int
            total_rec_late_fee
            recoveries
            collection_recovery_fee
            last_pymnt_d  $
            last_pymnt_amnt
            next_pymnt_d  $
            last_credit_pull_d  $
            collections_12_mths_ex_med
            mths_since_last_major_derog
            application_type  $
            annual_inc_joint
            dti_joint
            acc_now_delinq
            tot_coll_amt
            tot_cur_bal
            total_rev_hi_lim
            VAR51  $
            Months_36
            Months_60
;
if _ERROR_ then call symputx('_EFIERR_',1);  /* set ERROR detection macro variable */
run;

data loan;
	set project.loan;
run;

proc contents data=loan varnum;
run;

proc print data=loan(obs=10);
run;
/************************CHARACTER VARIABLES******************/

proc contents data=loan;
run;

/*Check Missing Values of Character Variables

title "Frequency of all categorical variable";
proc freq data=project.loan;
table VAR51
annual_inc_joint
application_type
dti_joint
earliest_cr_line
emp_length
emp_title
grade
home_ownership	
initial_list_status
issue_d
last_credit_pull_d 
last_pymnt_d 
loan_status 
next_pymnt_d 
purpose 
sub_grade 
term 
title 
verification_status /
NOPERCENT NOCUM;
run; */

/* Replace missing values for variables having missing values*/

title "Frequency of all categorical variable";
proc freq data=project.loan;
table /*emp_title*/
emp_length
title
last_pymnt_d
next_pymnt_d
VAR51
annual_inc_joint
dti_joint
 /
NOPERCENT NOCUM;
run;



proc print data= loan_missing (obs=20);
run;

/* Changing the data into uppercase */
 data updata;
set project.loan;
array char_vars(*) _character_;
do i = 1 to dim (char_vars);
char_vars(i) = upcase(char_vars(i));
end;
drop i;
run;
proc print data = updata(obs =20);
run;
/* Treat the missing values and replace them with undeclared */ 
data mydata; /* change format and length*/
length emp_title $100 emp_length $10 title $100 last_pymnt_d $10 next_pymnt_d $10 VAR51 $100 ;
format emp_length $10. emp_title $100. title $100. last_pymnt_d $10. next_pymnt_d $10. VAR51 $100. ;
set updata;
run;
data loan_missing;
set mydata;
array char_var {6} $ emp_title emp_length title last_pymnt_d next_pymnt_d VAR51;
do i=1 to 6;
if missing(char_var{i}) then char_var{i} = "Undeclared";
end;
drop i;
run;
proc contents data = loan_missing;
run;
proc print data = loan_missing(obs=20);
run;
/*Check the frequency of the missing values after treating them*/ 
title "Frequency of all categorical variable";
 proc freq data=loan_missing;
table /*emp title*/
emp_length 
title
last_pymnt_d 
next_pymnt_d
VAR51
annual_inc_joint 
dti_joint
/
NOPERCENT NOCUM; 
run;
/* derived variable*/
data der_data;
set loan_missing;
if grade = 'A' then review = 'Excellent';
else if grade in ('B', 'C') then review = 'Good';
else review = 'Fair/Poor';
run;
/* View the new review variable */
proc print data= der_data(keep= id emp_title grade review obs = 10);
/*********************Target variable*******************/
proc means data=project.loan;
var months_36;
run;

proc means data=project.loan;
var months_60;
run;

proc sgplot data=project.loan;
histogram months_36;
density months_36;
run;

proc sgplot data=project.loan;
histogram months_60;
density months_60;
run;


/******************NUMERIC VARIABLES*********************/
* there are 32 numeric variables in the dataset;
* check missing count descriptive stats of all numeric vars;
proc means data = loan;
	var _numeric_;
run;

* macro to check distribution of stats and var;
%macro num_check(varname);
proc univariate data=loan plot;
	var &varname;
	histogram;
run;
/*
proc sgplot data=loan;
	hbox &varname;
run;
*/
%mend;
*----------------------------------------------------;
* loan_amnt - amount of loan applied for by borrower;
*----------------------------------------------------;
%num_check(loan_amnt);
* no missing values;
* mean & median are close;
* check for outliers using IQR method;
%let Q1 = 8500;
%let Q3 = 20000;
%let IQR = %sysevalf(&Q3 - &Q1);
data outlier_IQR;
	set loan(keep= id loan_amnt);
	if loan_amnt < &Q1-1.5*&IQR
	or loan_amnt > &Q3+1.5*&IQR
	then outlier = 'Yes';
	else outlier = 'No';
	*if outlier = 'Yes' then &varname = &mean;
run;
title "Loan_amnt outliers (Yes/No) using IQR method";
proc freq data=outlier_IQR;
	tables outlier;
run;
* concluded based on IQR method - no outliers to handle;
*------------------------------------------;
* funded_amnt - amount of loan sanctioned;
*------------------------------------------;
%num_check(funded_amnt);
* no missing values;
* mean & median are close, is not skewed;
* values exactly same as loan_amt var, 
hence this var can be dropped, considering as duplicate;

data project.loan;
	set project.loan;
	drop funded_amt;
run;
*---------------------------------------;
* int_rate - interest rate on the loan;
*---------------------------------------;
%num_check(int_rate);
* no missing values;
* values seem correct;
* variable mean very close to median;
* using IQR method as variable is not normal;
%let Q1 = 9.17;
%let Q3 = 14.65;
%let IQR = %sysevalf(&Q3 - &Q1);
data outlier_IQR;
	set loan(keep= id int_rate);
	if int_rate < &Q1-1.5*&IQR
	or int_rate > &Q3+1.5*&IQR
	then outlier = 'Yes';
	else outlier = 'No';
	*if outlier = 'Yes' then &varname = &mean;
run;
title "int_rate outliers (Yes/No) using IQR method";
proc freq data=outlier_IQR;
	tables outlier;
run;
* applying root-4 transformation;
data outlier_IQR;
	set outlier_IQR;
	int_rate_log = (int_rate**(1/4));
run;
title "After root4 transformation on int_rate";
ods select moments histogram;
proc univariate data=outlier_IQR;
	var int_rate_log;
	histogram / normal;
run;
*------------------------------------------------;
* installment - monthly payment owed by borrower;
*------------------------------------------------;
%num_check(installment);
* no missing values;
* values seem correct;
* check for normality;
title "Check for normality - installment";
ods select TestsforNormality;
proc univariate data=loan normal;
	var installment;
	histogram /;
run;
* installment variable is not normal as per the kolmogrov-smirnov test as p<0.05;
* check for outliers using IQR method;
%let Q1 = 262.23;
%let Q3 = 578.79;
%let IQR = %sysevalf(&Q3 - &Q1);
* detect outlier in revol_bal based on IQR;
data outlier_installment_IQR;
	set loan(keep= id installment);
	if installment < &Q1-1.5*&IQR
	or installment > &Q3+1.5*&IQR
	then outlier = 'Yes';
	else outlier = 'No';
run;
* this method says there are 5849 outliers;
proc freq data=outlier_installment_IQR;
	tables outlier;
run;

data outlier_installment_IQR;
	set outlier_installment_IQR;
	installment_log = log(installment);
	installment_root4 = installment ** (1/4);
run;
ods select moments testsfornormality histogram;
proc univariate data=outlier_installment_IQR normal;
	var installment_log installment_root4;
	histogram / normal;
run;
* choose root4 transformation for installment variable;
*/
*---------------------;
* annual_inc variable;
*---------------------;
%num_check(annual_inc);
* check for outliers;
ods select TrimmedMeans;
proc univariate data=project.loan trim=0.1;
* trim 10%;
	var annual_inc;
run;
* trimmed means is much lesser than original mean;
* outliers need to be handled;
data outlier_annual_inc;
	set loan(keep= id annual_inc);
	annual_inc_log = log(annual_inc);
run;
title "After log transformation on annual_inc";
ods select moments testsfornormality histogram;
proc univariate data=outlier_annual_inc normal;
	var annual_inc_log;
	histogram / normal;
run;

*-----------------------------------;
*variable dti - debt to income ratio;
*-----------------------------------;
%num_check(dti);
* customers with dti value = 0;
proc print data=loan;
	where dti = 0;
run;
* all customers with dti =0 have a valid installment and income amount;
* hence, dti for these customers need to be corrected;
* using installment / (annual_inc/12) ;
data loan;
	set loan;
	if dti = 0 then dti = installment / (annual_inc/12);
run;

* customers with dti = 9999;
proc print data=loan;
	where dti = 9999;
run;
* dti need to be corrected but annual inc is 0 for these customers;
* dti marked missing, as no way to calculate dti;
data loan;
	set loan;
	if dti = 9999 then dti = .;
run;

title "Check for normality - dti";
ods select TestsforNormality histogram;
proc univariate data=loan normal;
	var dti;
	histogram / normal;
run;

* check for outliers using IQR method;
%let Q1 = 12.66;
%let Q3 = 25.52;
%let IQR = %sysevalf(&Q3 - &Q1);
* detect outlier in revol_bal based on IQR;
data outlier_dti_IQR;
	set loan(keep= id installment annual_inc dti);
	if dti < &Q1-1.5*&IQR
	or dti > &Q3+1.5*&IQR
	then outlier = 'Yes';
	else outlier = 'No';
run;
title "Outliers using IQR method - dti";
proc freq data=outlier_dti_IQR;
	tables outlier;
run;
title "List of 52 outliers detected for dti";
proc print data=outlier_dti_IQR;
	where outlier = 'Yes';
run;
* outliers replaced with calculated values;
data outlier_dti_IQR_updated;
	set outlier_dti_IQR;
	if not missing(dti) and outlier = 'Yes'
	then dti_updated = installment / (annual_inc/12);
	else dti_updated = dti;
run;
title "After replacing outliers of dti with calculated values";
proc univariate data=outlier_dti_IQR_updated normal;
	var dti_updated;
	histogram / normal;
run;

*-------------------------------------------------------;
* delinq_2yrs - number of delinquencies in last 2 years;
*-------------------------------------------------------;
%num_check(delinq_2yrs);
* no missing values;
* Around 75% of values is 0;
* Hence creating derived categorical variable;
data test2;
	set loan(keep= id delinq_2yrs Months_36);
	if delinq_2yrs = 0 then delinq_2yrs_flag = 'No ';
	else delinq_2yrs_flag = 'Yes';
run;
* impact of var on target Months_36;
proc sgplot data=test2;
    vbar delinq_2yrs_flag / response=Months_36 groupdisplay=cluster stat=freq;
    yaxis grid;
run;

proc sort data=loan;
	by id;
run;

proc sort data=test2;
	by id;
run;
* replace delinq_2yrs with derived variable delinq_2yrs_flag;
data loan;
	merge loan test2;
	by id;
	drop delinq_2yrs;
run;
* check if derived variable successfully added to loan dataset;
proc contents data=loan varnum;
run;

*-----------------------------------------------------------------;
* inq_last_6mths - inquiries by borrower for loan in last 6 months;
*-----------------------------------------------------------------;
%num_check(inq_last_6mths);
* no missing values;
* range from 0 to 5;
* impact of var on target Months_36;
proc freq data=loan;
    tables months_36 * inq_last_6mths / plots=mosaicplot;
run;
* create derived variable, as inq_last_6mths is more categorical in nature;
data loan;
	set loan;
	if inq_last_6mths = 0 then inq_last_6mths_flag = 0;
	else inq_last_6mths_flag = 1;
	drop inq_last_6mths;
run;

*--------------------------------------------------------------------------------;
*mths_since_last_delinq - months passed since borrower last missed timely payment;
*--------------------------------------------------------------------------------;
%num_check(mths_since_last_delinq);
* find missing values;
data test (keep= id mths_since_last_delinq);
	set loan;
	if missing(mths_since_last_delinq) then output;
run;

* impute missing values with zero;
* if this var is missing, we assume that it means the customer did not miss his payment;
data loan;
	set loan;
	if missing(mths_since_last_delinq) then mths_since_last_delinq = 0;
run;

* check if imputation complete;
data test (keep= id mths_since_last_delinq);
	set loan;
	if missing(mths_since_last_delinq) then output;
run;

title "mths_since_last_delinq distribution by target var";
proc univariate data=loan noprint;
	histogram mths_since_last_delinq;
	class months_36;
run;
* converting variable into interval variable;
proc rank data=loan out=loan groups=4;
	var mths_since_last_delinq;
	ranks mths_since_last_delinq_group;
run;
title "mths_since_last_delinq_group vs. target var";
proc freq data=loan;
	table mths_since_last_delinq_group;
	table mths_since_last_delinq_group * months_36 / plots=mosaicplot;
run;

*------------------------------------------------------;
* open_acc - number of open credit lines for a borrower;
*------------------------------------------------------;
%num_check(open_acc);
* skewed distribution;
* need to handle extreme values;

* check correctness - if no. of open credits is greater than total credits;
data _null_;
	set loan;
	file print;
	if open_acc > total_acc then output;
run;
* positively skewed distribution;
title "Check for normality - open_acc";
ods select TestsforNormality histogram;
proc univariate data=loan normal;
	var open_acc;
	histogram / normal;
run;

* check for outliers using IQR method;
%let Q1 = 8;
%let Q3 = 15;
%let IQR = %sysevalf(&Q3 - &Q1);
* detect outlier in revol_bal based on IQR;
data outlier_open_acc_IQR;
	set loan(keep= id open_acc);
	if open_acc < &Q1-1.5*&IQR
	or open_acc > &Q3+1.5*&IQR
	then outlier = 'Yes';
	else outlier = 'No';
run;
title "Outliers using IQR method - open_acc";
proc freq data=outlier_open_acc_IQR;
	tables outlier;
run;

data outlier_open_acc_IQR;
	set outlier_open_acc_IQR;
	open_acc_log = open_acc ** 0.25;
run;
* root4 transformation chosen as it reduced the skewness better compared to log and root2;
title "After root4 transformation on open_acc";
ods select moments testsfornormality histogram;
proc univariate data=outlier_open_acc_IQR normal;
	var open_acc_log;
	histogram / normal;
run;

*----------------------------------------------;
* pub_rec - number of derogatory public records;
*----------------------------------------------;
%num_check(pub_rec);
* more than 75% values zero;
* iqr = 0;
* create derived variable, as pub_rec is more categorical in nature;
data loan;
	set loan;
	if pub_rec = 0 then pub_rec_flag = 0;
	else pub_rec_flag = 1;
	drop pub_rec;
run;

title "Plot of pub_rec_flag vs target var months_36";
proc freq data= loan;
	tables months_36 * pub_rec_flag / plots=mosaicplot;
run;

*-------------------------------------------;
* revol_bal - total credit revolving balance;
*-------------------------------------------;
%num_check(revol_bal);
* no missing values;
* positively skewed distribution;
* outliers need to be handled;
%let Q1 = 6545;
%let Q3 = 21588;
%let IQR = 15043;
* detect outlier in revol_bal based on IQR;
data outlier_revol_bal;
	set loan(keep= id revol_bal);
	if revol_bal < &Q1-1.5*&IQR
	or revol_bal > &Q3+1.5*&IQR
	then outlier = 'Yes';
	else outlier = 'No';
run;

proc freq data = outlier_revol_bal;
	table outlier /nocum nopercent;
run;

* decide which transform to apply - log or root4;
data loan_1;
	set loan(keep= id revol_bal);
	revol_bal_log = log(revol_bal);
	revol_bal_root4 = revol_bal ** 0.25;
run;
title "After applying transformation on revol_bal";
ods select testsfornormality moments histogram;
proc univariate data=loan_1 normal;
	var revol_bal_log revol_bal_root4;
	histogram / normal;
run;

* choosing root4 transformation, as mean & median very close
after applying this & skewness closer to zero;
data loan;
	set loan;
	revol_bal_root4 = revol_bal **0.25;
	*drop revol_bal;
run;

*----------------------------------------------------------------------;
* revol_util - amount of credit borrower is using relative to revol_bal;
*----------------------------------------------------------------------;
title "Descriptive statistics of revol_util";
%num_check(revol_util);

* list of records where revol_util value is missing;
title "Missing Values for revol_util";
proc print data=loan noobs;
	var id revol_bal revol_util;
	where missing(revol_util);
run;

%let revol_util_mean = 53;
* imputing missing values for revol_util based on revol_bal;
data loan;
	set loan;
	if missing(revol_util) then do;
		if revol_bal = 0 then revol_util = 0;
		else if revol_bal > 0 then revol_util = &revol_util_mean;
	end;
run;
* check if missing values are nil for revol_util;
ods select moments histogram testsfornormality;
proc univariate data=loan normal;
	var revol_util;
	histogram / normal;
run;
*-------------------------------------------------------;
* total_acc - total number of credit lines of a borrower;
*-------------------------------------------------------;
%num_check(total_acc);
* no missing values;
* extreme values present;
* using trimming to detect outliers;
ods select trimmedmeans;
proc univariate data=loan trim=0.1;
	var total_acc;
run;
* apply transformation;
data loan_1;
	set loan(keep= id total_acc);
	total_acc_log = log(total_acc);
	total_acc_root4 = total_acc ** 0.25;
run;
title "After applying transformation on total_acc";
ods select testsfornormality moments histogram;
proc univariate data=loan_1 normal;
	var total_acc_log total_acc_root4;
	histogram / normal;
run;

* choosing root4 transformation, as skewness is reduced more;
data loan;
	set loan;
	total_acc_root4 = total_acc ** 0.25;
	*drop total_acc;
run;

*--------------------------------------------------------------------;
* out_prncp - remaining outstanding principal for total amount funded;
*--------------------------------------------------------------------;
%num_check(out_prncp);
title "Test for Normality - out_prncp";
ods select testsfornormality;
proc univariate data=loan normal;
	var out_prncp;
run;
* skewed variable;
* check for incorrect values;
* if out_prncp is greater than loan_amnt then incorrect value;
title "Incorrect values of out_prncp";
data _null_;
	set loan(keep=id loan_amnt out_prncp);
	file print;
	if out_prncp > loan_amnt then put id= loan_amnt= out_prncp=;
run;
%let out_prncp_median = 12823.90;
data loan;
	set loan;
	if out_prncp > loan_amnt then out_prncp = &out_prncp_median;
run;
title "After correction of values - out_prncp";
%num_check(out_prncp);

ods select TestsForNormality;
proc univariate data=loan normal;
	var out_prncp;
run;

*total_paymnt;
*--------------;
ods select TestsForNormality plots;
proc univariate data=loan normal plot;
	var total_pymnt;
run;
* check for normality;
* skewed variable, need to handle outliers;
* applied log transformation as var is skewed;
data loan;
	set loan;
	log_total_pymnt = log(total_pymnt);
run;
ods select TestsForNormality plots;
proc univariate data=loan normal plot;
	var total_pymnt log_total_pymnt;
run;
* From Kolmogrov Smirnov test d close to 0 and p < 0.05
after applying log transformation;


/*Pia Ivory*/

/*************************************************
total_rec_prncp - Principal received till date.
**************************************************/
*No missing values, Skewed distribution, Using IQR to check outliers, Outliers need to handle;
%num_check(total_rec_prncp);
%let Q1 = 328.22;
%let Q3 = 1165.99;
%let IQR = 837.77000;

data outlier_total_rec_prncp;
	set loan(keep= id total_rec_prncp);
	if total_rec_prncp < &Q1-1.5*&IQR
	or total_rec_prncp > &Q3+1.5*&IQR
	then output;
run;

proc contents data=outlier_total_rec_prncp;
run;


/*************************************************
total_rec_int - Interest received till date.
**************************************************/
*No missing values, Skewed distribution, Using IQR to check outliers, Applied log to handle outlier;
%num_check(total_rec_int);
%let Q1 = 142.92;
%let Q3 = 631.20;
%let IQR = 488.28000;

data outlier_total_rec_int;
	set loan(keep= id total_rec_int);
	if total_rec_int < &Q1-1.5*&IQR
	or total_rec_int > &Q3+1.5*&IQR
	then output;
run;

proc contents data=outlier_total_rec_int;
run;

ods select TestsForNormality plots;
proc univariate data=loan normal plot;
	var total_rec_int;
run;
* applied log transformation as var is right skewed;
data loan;
	set loan;
	log_total_rec_int = log(total_rec_int);
run;

ods select TestsForNormality plots;
proc univariate data=loan normal plot;
	var total_rec_int log_total_rec_int;
run;


/*************************************************
total_rec_late_fee - Late fees received to date.
**************************************************/
*No missing values, Skewed distribution, creating derived categorical value;
%num_check(total_rec_late_fee); 
data fee;
   set loan;
   if total_rec_late_fee = 0 then total_rec_late_fee_flag = "No ";
   else if total_rec_late_fee > 0 then total_rec_late_fee_flag = "Yes";
run;

proc sgplot data=fee;
   title "Distribution of Late Fee Flag";
   hbar total_rec_late_fee_flag / group=total_rec_late_fee_flag groupdisplay=cluster datalabel;
   xaxis display=(nolabel);
   yaxis grid;
run;


/********************************************************************
recoveries - Total recovery procedures initiated against the borrower.
*********************************************************************/
*No missing values, Skewed distribution, Derived categorical variable;
%num_check(recoveries);
data loan;
   set loan;
   if recoveries = 0 then recoveries_flag = "No ";
   else if recoveries > 0 then recoveries_flag = "Yes";
run;

proc sgplot data=loan;
   title "Distribution of tot_coll_amt_flag";
   hbar recoveries_flag / group=recoveries_flag groupdisplay=cluster datalabel;
   xaxis display=(nolabel);
   yaxis grid;
run;

/***************************************************************************
collection_recovery_fee - The fees collected during the recovery procedures.
*****************************************************************************/
*No missing values, Skewed distribution, Column can be dropped as not relevant to this analysis.;
%num_check(collection_recovery_fee);

/******************************************************
last_pymnt_amnt - The last payment amount received.
*******************************************************/
*No missing values, Skewed distribution, Using IQR to check outliers, Applied log to handle outlier;
%num_check(last_pymnt_amnt);
%let Q1 = 250.00;
%let Q3 = 572.61;
%let IQR = 322.61000;

data outlier_last_pymnt_amnt;
	set loan(keep= id last_pymnt_amnt);
	if last_pymnt_amnt < &Q1-1.5*&IQR
	or last_pymnt_amnt > &Q3+1.5*&IQR
	then output;
run;

proc contents data=outlier_last_pymnt_amnt;
run;

ods select TestsForNormality plots;
proc univariate data=loan normal plot;
	var last_pymnt_amnt;
run;

data loan;
	set loan;
	log_last_pymnt_amnt = log(last_pymnt_amnt);
run;

ods select TestsForNormality plots;
proc univariate data=loan normal plot;
	var last_pymnt_amnt log_last_pymnt_amnt;
run;

/***************************************************************************
collections_12_mths_ex_med - Number of collections in 12 months excluding medical collections;
*****************************************************************************/
%num_check(collections_12_mths_ex_med);

/***************************************************************************
mths_since_last_major_derog - Months since most recent 90-day delinquency or worse rating;
*****************************************************************************/
%num_check(mths_since_last_major_derog);
* find missing values;
data test (keep= id mths_since_last_major_derog);
	set loan;
	if missing(mths_since_last_major_derog) then output;
run;

* impute missing values with zero;
* if this var is missing, it may indicate that the borrower has not had any derogatory events in the past.;
data loan;
	set loan;
	if missing(mths_since_last_major_derog) then mths_since_last_major_derog = 0;
run;

* check if imputation complete;
data test (keep= id mths_since_last_major_derog);
	set loan;
	if missing(mths_since_last_major_derog) then output;
run;

/*************************************************************************************************************
annual_inc_joint - The combined self-reported annual income provided by the co-borrowers during registration
*************************************************************************************************************/
%num_check(annual_inc_joint);
*missing values - High Volume of missing values and can be dropped as dti column is already provided.
This is analyzing the borrower's ability to replay the loan based on their individual situation hence dti column may be sufficient for the analysis.;


/*************************************************************************************************************
* dti_joint - A ratio calculated using the co-borrowers' total monthly payments on the total debt obligations,
excluding mortgages and the requested LC loan, divided by the co-borrowers' combined self-reported monthly income;
***************************************************************************************************************/
%num_check(dti_joint);
*missing values - High Volume of missing values and can be dropped as dti column is already provided.
This is analyzing the borrower's ability to replay the loan based on their individual situation hence dti column may be sufficient for the analysis.;

/*****************************************************************************
acc_now_delinq - The number of accounts on which the borrower is now delinquent;
*****************************************************************************/
*No missing values, Skewed distribution, creating derived categorical value;
%num_check(acc_now_delinq);
data loan;
   set loan;
   if acc_now_delinq = 0 then acc_now_delinq_flag = "No ";
   else if acc_now_delinq > 0 then acc_now_delinq_flag = "Yes";
run;

/*Distribution of acc_now_delinq_flag*/
proc sgplot data=loan;
   title "Distribution of acc_now_delinq_flag";
   hbar acc_now_delinq_flag / group=acc_now_delinq_flag groupdisplay=cluster datalabel;
   xaxis display=(nolabel);
   yaxis grid;
run;

/********************************************************************
tot_coll_amt - Total collection amounts ever owed by the borrower
**********************************************************************/
*No missing values, Skewed distribution, creating derived categorical value;
%num_check(tot_coll_amt);
data loan;
   set loan;
   if tot_coll_amt = 0 then tot_coll_amt_flag = "No ";
   else if tot_coll_amt > 0 then tot_coll_amt_flag = "Yes";
run;

proc sgplot data=loan;
   title "Distribution of tot_coll_amt_flag";
   hbar tot_coll_amt_flag / group=tot_coll_amt_flag groupdisplay=cluster datalabel;
   xaxis display=(nolabel);
   yaxis grid;
run;

/*************************************************************************
tot_cur_bal - Total current balance of all accounts owned by the borrower
***************************************************************************/
*No missing values, Skewed distribution, Using IQR to check outliers, Applied log to handle outlier;
%num_check(tot_cur_bal);
%let Q1 = 31433;
%let Q3 = 209710;
%let IQR = 178277;

data outlier_tot_cur_bal;
	set loan(keep= id tot_cur_bal);
	if tot_cur_bal < &Q1-1.5*&IQR
	or tot_cur_bal > &Q3+1.5*&IQR
	then output;
run;

proc contents data=outlier_tot_cur_bal;
run;

ods select TestsForNormality plots;
proc univariate data=loan normal plot;
	var tot_cur_bal;
run;

data loan;
	set loan;
	log_tot_cur_bal = log(tot_cur_bal);
run;

ods select TestsForNormality plots;
proc univariate data=loan normal plot;
	var tot_cur_bal log_tot_cur_bal;
run;


/***************************************************
total_rev_hi_lim -Total high credit/credit limit
****************************************************/
*No missing values, Skewed distribution, Using IQR to check outliers, Applied log to handle outlier;
%num_check(total_rev_hi_lim);
%let Q1 = 14600;
%let Q3 = 42600;
%let IQR = 28000;

data outlier_total_rev_hi_lim;
	set loan(keep= id total_rev_hi_lim);
	if total_rev_hi_lim < &Q1-1.5*&IQR
	or total_rev_hi_lim > &Q3+1.5*&IQR
	then output;
run;

proc contents data=outlier_total_rev_hi_lim;
run;

ods select TestsForNormality plots;
proc univariate data=loan normal plot;
	var total_rev_hi_lim;
run;

data loan;
	set loan;
	log_total_rev_hi_lim = log(total_rev_hi_lim);
run;

ods select TestsForNormality plots;
proc univariate data=loan normal plot;
	var total_rev_hi_lim log_total_rev_hi_lim;
run;

/***************************************************************************************************************
Months_36 - represent the term or length of the loan in months.(represent loans with a 36-month (3-year) term,)
****************************************************************************************************************/
%num_check(Months_36);
* find missing values;
data test (keep= id Months_36);
	set loan;
	if missing(Months_36) then output;
run;

* impute missing values with zero;
* if this var is missing, it may indicate that the borrower has not had any derogatory events in the past.;
data loan;
	set loan;
	if missing(Months_36) then Months_36 = 0;
run;

* check if imputation complete;
data test (keep= id Months_36);
	set loan;
	if missing(Months_36) then output;
run;

/***************************************************************************************************************
* Months_60 - represent the term or length of the loan in months.("Months_60" may represent loans with a 60-month (5-year) term);
****************************************************************************************************************/
%num_check(Months_60);
data test (keep= id Months_60);
	set loan;
	if missing(Months_60) then output;
run;

* impute missing values with zero;
* if this var is missing, it may indicate that the borrower has not had any derogatory events in the past.;
data loan;
	set loan;
	if missing(Months_60) then Months_60 = 0;
run;

* check if imputation complete;
data test (keep= id Months_60);
	set loan;
	if missing(Months_60) then output;
run;

    
