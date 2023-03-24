with raw_reviews
as (
select * from AIRBNB.RAW.RAW_REVIEWS
)
select
LISTING_ID,
DATE as review_DATE,
COMMENTS as review_text, 
SENTIMENT as review_sentient

from raw_reviews