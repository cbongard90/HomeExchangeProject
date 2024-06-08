-- Null value for finalised_at: create a boolean value to indicate if the exchange is finalised or not
-- Date present: represents the date the exchange was finalised
-- Date not present: the date was not finalised
SELECT 
    conversation_id, finalized_at,
    IF(finalized_at IS NOT NULL, 1, 0) AS finalized
FROM `le-wagon-1580.home_exchange.exchanges`;

-- Null values in capacity: remove
SELECT 
    COUNT(*)
FROM `le-wagon-1580.home_exchange.exchanges`
WHERE capacity IS NULL;

-- Null value in country: check if they have a value in the region/city/department column
-- Populate only if there are values in the region/city/department column


-- Cancelation date
SELECT 
    conversation_id, 
    guest_user_id,
    host_user_id,
    creator_id,
    canceled_at,user_cancellation_id,
    IF(canceled_at IS NOT NULL, 1, 0) AS cancelled
FROM `le-wagon-1580.home_exchange.exchanges`

WHERE user_cancellation_id IS NOT NULL
AND canceled_at IS NULL
AND creator_id = user_cancellation_id;

-- Data confirmation check
-- remove any null values in the following: conversation_id, guest_user_id, host_user_id, creator_id, exchange_id
SELECT 
 *
FROM `le-wagon-1580.home_exchange.exchanges`

WHERE 
  conversation_id IS NULL  
  OR guest_user_id IS NULL
  OR host_user_id IS NULL
  OR exchange_id IS NULL
  OR creator_id IS NULL;


-- For Home Type, replace null values with 'Other'
-- Lowercase the home type values
SELECT
* ,
IF(
  home_type IS NULL,
  'other',
  LOWER(home_type) 
) AS home_type
FROM `le-wagon-1580.home_exchange.exchanges`;

-- For Residence Type, replace null values with 'Other'
-- Lowercase the residence values
SELECT
* ,
IF(
  residence_type IS NULL,
  'other',
  LOWER(residence_type) 
) AS residence_type
FROM `le-wagon-1580.home_exchange.exchanges`;