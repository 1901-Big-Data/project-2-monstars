use default;

CREATE TABLE dim_pledged
(id_num int, currency varchar(100), pledged float, usd_pledged float, usd_pledged_real float);

CREATE TABLE dim_date
(id_num int, launched timestamp, deadline date);

CREATE TABLE dim_main_category
(id_num int, main_category varchar(255));

CREATE TABLE dim_specific_category
(id_num int, specific_category varchar(255));

CREATE TABLE dim_campaign
(id_num int, campaign varchar(255));

CREATE TABLE dim_campaign_state
(id_num int, campaign_state varchar(255));

CREATE TABLE dim_country
(id_num int, country varchar(255));

CREATE TABLE dim_backers
(id_num int, backers int);

