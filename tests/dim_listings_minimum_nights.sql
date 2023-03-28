-- this is custom test to be correct it must retun nothing
select * 
from 
{{ ref('dim_listings_cleansed') }}
where minimum_nights < 1
limit 10