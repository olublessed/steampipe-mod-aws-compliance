select
  -- Required Columns
  arn as resource,
  case
    when expiration_date < (current_date - interval '1' minute) then 'alarm'
    else 'ok'
  end as status,
  case
    when expiration_date < (current_date - interval '1' minute) then title || ' expired on ' || to_char(expiration_date, 'DD-Mon-YYYY') || '.'
    else title || ' set to expire in ' || extract(day from expiration_date - current_date) || ' days.'
  end as reason,
  -- Additional Dimensions
  region,
  account_id
from
  aws_route53_domain;