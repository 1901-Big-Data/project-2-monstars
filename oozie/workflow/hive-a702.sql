USE default;

INSERT OVERWRITE LOCAL DIRECTORY '/home/cloudera/Documents/HiveOutput/Q1' 
select specific_category, sum(backers) as sumB
from kickstart
group by specific_category
order by sumB desc
limit 5;

INSERT OVERWRITE LOCAL DIRECTORY '/home/cloudera/Documents/HiveOutput/Q2'
select specific_category, sum(usd_pledged_real) as sumUSD
from kickstart
group by specific_category
order by sumUSD desc
limit 5;

INSERT OVERWRITE LOCAL DIRECTORY '/home/cloudera/Documents/HiveOutput/Q3'
SELECT specific_category, COUNT(*) numOfFailures 
from kickstart 
where campaign_state = 'failed' 
group by specific_category 
order by numOfFailures desc 
limit 5;

INSERT OVERWRITE LOCAL DIRECTORY '/home/cloudera/Documents/HiveOutput/Q4'
SELECT DISTINCT campaign, backers, usd_pledged 
FROM kickstart 
order by usd_pledged desc 
limit 100;

INSERT OVERWRITE LOCAL DIRECTORY '/home/cloudera/Documents/HiveOutput/Q5/wk0-2'
SELECT (succ.numerator/alltables.denominator) * 100
FROM 
	(SELECT count(*) numerator 
	from kickstart 
	where datediff(date_format(deadline, 'yyyy-mm-dd'), date_format(launched, 'yyyy-mm-dd')) < 14 and campaign_state='successful' ) succ 
join
	 (SELECT count(*) denominator 
	 from kickstart 
	 where datediff(date_format(deadline, 'yyyy-mm-dd'), date_format(launched, 'yyyy-mm-dd')) < 14) alltables
on 1=1;

INSERT OVERWRITE LOCAL DIRECTORY '/home/cloudera/Documents/HiveOutput/Q5/wk2-4'
SELECT (succ.numerator/alltables.denominator) * 100 
FROM 
	(SELECT count(*) numerator from kickstart where datediff(date_format(deadline, 'yyyy-mm-dd'), date_format(launched, 'yyyy-mm-dd')) BETWEEN 14 and 28 and campaign_state='successful' ) succ
join 
	(SELECT count(*) denominator from kickstart where datediff(date_format(deadline, 'yyyy-mm-dd'), date_format(launched, 'yyyy-mm-dd')) BETWEEN 14 and 28) alltables 
on 1=1;

INSERT OVERWRITE LOCAL DIRECTORY '/home/cloudera/Documents/HiveOutput/Q5/wk4-6'
SELECT (succ.numerator/alltables.denominator) * 100 
FROM 
	(SELECT count(*) numerator from kickstart where datediff(date_format(deadline, 'yyyy-mm-dd'), date_format(launched, 'yyyy-mm-dd')) BETWEEN 28 and 42 and campaign_state='successful' ) succ
join 
	(SELECT count(*) denominator from kickstart where datediff(date_format(deadline, 'yyyy-mm-dd'), date_format(launched, 'yyyy-mm-dd')) BETWEEN 28 and 42) alltables 
on 1=1;

INSERT OVERWRITE LOCAL DIRECTORY '/home/cloudera/Documents/HiveOutput/Q5/wk6-8'
SELECT (succ.numerator/alltables.denominator) * 100 
FROM 
	(SELECT count(*) numerator from kickstart where datediff(date_format(deadline, 'yyyy-mm-dd'), date_format(launched, 'yyyy-mm-dd')) BETWEEN 42 and 56 and campaign_state='successful' ) succ
join 
	(SELECT count(*) denominator from kickstart where datediff(date_format(deadline, 'yyyy-mm-dd'), date_format(launched, 'yyyy-mm-dd')) BETWEEN 42 and 56) alltables 
on 1=1;

INSERT OVERWRITE LOCAL DIRECTORY '/home/cloudera/Documents/HiveOutput/Q5/wk8-10'
SELECT (succ.numerator/alltables.denominator) * 100 
FROM 
	(SELECT count(*) numerator from kickstart where datediff(date_format(deadline, 'yyyy-mm-dd'), date_format(launched, 'yyyy-mm-dd')) BETWEEN 56 and 70 and campaign_state='successful' ) succ
join 
	(SELECT count(*) denominator from kickstart where datediff(date_format(deadline, 'yyyy-mm-dd'), date_format(launched, 'yyyy-mm-dd')) BETWEEN 56 and 70) alltables 
on 1=1;

INSERT OVERWRITE LOCAL DIRECTORY '/home/cloudera/Documents/HiveOutput/Q5/wk10-12'
SELECT (succ.numerator/alltables.denominator) * 100 
FROM 
	(SELECT count(*) numerator from kickstart where datediff(date_format(deadline, 'yyyy-mm-dd'), date_format(launched, 'yyyy-mm-dd')) BETWEEN 70 and 84 and campaign_state='successful' ) succ
join 
	(SELECT count(*) denominator from kickstart where datediff(date_format(deadline, 'yyyy-mm-dd'), date_format(launched, 'yyyy-mm-dd')) BETWEEN 70 and 84) alltables 
on 1=1;

INSERT OVERWRITE LOCAL DIRECTORY '/home/cloudera/Documents/HiveOutput/Q5/wk12onw'
SELECT (succ.numerator/alltables.denominator) * 100
FROM 
	(SELECT count(*) numerator 
	from kickstart 
	where datediff(date_format(deadline, 'yyyy-mm-dd'), date_format(launched, 'yyyy-mm-dd')) >= 84  and campaign_state='successful' ) succ 
join
	 (SELECT count(*) denominator 
	 from kickstart 
	 where datediff(date_format(deadline, 'yyyy-mm-dd'), date_format(launched, 'yyyy-mm-dd')) >= 84) alltables
on 1=1;

INSERT OVERWRITE LOCAL DIRECTORY '/home/cloudera/Documents/HiveOutput/Q6/lt100'
select (success.numerator/total.denominator) * 100
from 
(SELECT count(*) numerator from kickstart where usd_goal_real < 100 and campaign_state='successful') success 
join
(SELECT count(*) denominator from kickstart where usd_goal_real < 100) total;

INSERT OVERWRITE LOCAL DIRECTORY '/home/cloudera/Documents/HiveOutput/Q6/bt100n1000'
select (success.numerator/total.denominator) * 100
from 
(SELECT count(*) numerator from kickstart where usd_goal_real between 100 and 1000 and campaign_state='successful') success 
join
(SELECT count(*) denominator from kickstart where usd_goal_real between 100 and 1000) total;

INSERT OVERWRITE LOCAL DIRECTORY '/home/cloudera/Documents/HiveOutput/Q6/bt1000n10000'
select (success.numerator/total.denominator) * 100
from 
(SELECT count(*) numerator from kickstart where usd_goal_real between 1000 and 10000 and campaign_state='successful') success 
join
(SELECT count(*) denominator from kickstart where usd_goal_real between 1000 and 10000) total;

INSERT OVERWRITE LOCAL DIRECTORY '/home/cloudera/Documents/HiveOutput/Q6/bt10000n100000'
SELECT (success.numerator/total.denominator) * 100
from 
(SELECT count(*) numerator from kickstart where usd_goal_real between 10000 and 100000 and campaign_state='successful') success 
join
(SELECT count(*) denominator from kickstart where usd_goal_real between 10000 and 100000) total;

INSERT OVERWRITE LOCAL DIRECTORY '/home/cloudera/Documents/HiveOutput/Q6/100000onw'
select (success.numerator/total.denominator) * 100
from 
(SELECT count(*) numerator from kickstart where usd_goal_real > 100000 and campaign_state='successful') success 
join
(SELECT count(*) denominator from kickstart where usd_goal_real > 100000) total;