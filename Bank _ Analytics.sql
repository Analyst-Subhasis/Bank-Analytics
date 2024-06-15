                                      #Bank_Analytics Project 
                                      
# KPI-1   - :    Issue Date wise loan amount Status


select issue_d as issue_d,
sum(loan_amnt) as Total_loan_amnt
from F1
group by issue_d
order by issue_d;

# KPI-2 -:       Grade and sub grade wise revol balance


select grade,sub_grade,sum(revol_bal) as Total_Revol_Bal
from F1 inner join F2
on (F1.id=F2.id)
group by grade,sub_grade
order by grade,sub_grade;

# KPI-3 -        Total Payment for Verified Status Vs Total Payment for Non Verified Status


select verification_status,
concat("$",format(round(sum(total_pymnt)/1000000,2),2),"M") as Total_payment
from F1 inner join F2
on (F1.id=F2.id)
group by verification_status;

# KPI-4 -:        State wise and last_credit_pull_d wise loan status


select addr_state,last_credit_pull_d,Loan_status
from F1 inner join F2
on (F1.id=F2.id)
group by addr_state,last_credit_pull_d,Loan_status
order by last_credit_pull_d;

# KPI 5 -:       Home ownership Vs last payment date status


select home_ownership,last_pymnt_d,
concat('$',format(round(sum(last_pymnt_amnt)/10000,2),2),'K') as Total_Amount
from F1 inner join F2
on (F1.id=F2.id)
group by home_ownership,last_pymnt_d
order by last_pymnt_d desc,home_ownership desc;  

#   More_Insights  _ :::

select term as Duration,
sum(loan_amnt) as Loan_Amount
from F1
group by term
order by term ; 


select purpose as purpose,
sum(loan_amnt) as loan_amount
from F1
group by purpose
order by purpose ;


                         #Thank_You......................                             