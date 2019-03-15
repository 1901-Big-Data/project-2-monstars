USE default;

INSERT OVERWRITE LOCAL DIRECTORY '/home/cloudera/Documents/HiveOutput' select specific_category, sum(backers) as sumB
from kickstartCopy
group by specific_category
order by sumB desc
limit 5;


