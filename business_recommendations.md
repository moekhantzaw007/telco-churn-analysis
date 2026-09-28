# Business Recommendations: Reducing Customer Churn

## Summary

Churn removes about $139,131 in monthly recurring revenue, or 30.5% of the monthly total. Churned customers pay more than average, so the revenue share lost is higher than the customer share (26.5%).

The loss is concentrated. Month-to-month customers account for 87% of lost revenue, and one segment within them (month-to-month contract, fiber optic internet, electronic check payment) accounts for about 49%. That segment is 1,307 customers, roughly 19% of the base, and churns at 60.4%.

I recommend a targeted retention effort on that segment first, followed by a broader push to move month-to-month customers onto longer contracts. Both should be tested against a control group before being scaled.

## What the data shows

| Factor | Churn rate | Comparison |
|---|---|---|
| Month-to-month contract | 42.7% | 11.3% (one-year), 2.8% (two-year) |
| Tenure 0-12 months | 47.4% | 9.5% (49-72 months) |
| Electronic check | 45.3% | 15.2% to 19.1% (other methods) |
| Fiber optic | 41.9% | 19.0% (DSL) |
| No tech support | 41.6% | 15.2% (with tech support) |
| Month-to-month, no tech support | 50.4% | 30.7% (month-to-month, with tech support) |

Cross-tabulations were used to check whether each factor holds up once the others are controlled for:

- Contract type still separates churners within every tenure group. Among customers with 49-72 months of tenure, month-to-month churn is 26.0% versus 12.9% (one-year) and 3.3% (two-year).
- Tech support matters mainly for month-to-month customers (a gap of about 20 points). On one-year and two-year contracts the gap is 1 to 2 points.
- Fiber optic churns more than DSL on every payment method, and electronic check adds to that. Fiber with electronic check churns at 53.2%.

## Recommendations

### 1. Retention offer for the high-risk segment

Target the 1,307 customers on month-to-month contracts with fiber optic service who pay by electronic check. Offer a modest bill credit for switching to automatic payment, combined with a discounted one-year contract.

This segment holds about half of the revenue lost to churn, so a campaign aimed at it is much cheaper than a company-wide one. Success metrics are the segment's churn rate and monthly revenue retained.

### 2. Move month-to-month customers to one-year contracts

There are 3,875 month-to-month customers. Start with those in their first year (1,994 customers, 51.4% churn), then extend to the rest. A price lock or small discount for a one-year commitment is the simplest offer to test.

Success metrics are the conversion rate to one-year plans and the churn rate of converted customers compared with those who stay month-to-month.

### 3. Support bundle trial for month-to-month customers

Offer a fixed-length trial (for example, three months) of tech support and online security to month-to-month customers who do not have them. The churn gap is large for this group and small elsewhere, so the offer should not be extended to customers on longer contracts.

Success metrics are trial uptake and the churn rate of trial users compared with similar non-users.

### Supporting actions

- **First-year onboarding.** Churn is highest in the first 12 months, so proactive contact during the first 90 days is worth testing.
- **Fiber optic investigation.** Fiber churns more than DSL even for customers on automatic payment. The data cannot explain why. A short customer survey on price, reliability, and competing offers would clarify this before any pricing change.

## Estimated impact

The table applies a range of churn reductions to the high-risk segment, which currently loses $68,282 per month.

| Churn reduction in segment | Monthly revenue protected | Annualized |
|---|---|---|
| 10% | $6,828 | $81,938 |
| 20% | $13,656 | $163,876 |
| 30% | $20,484 | $245,813 |

These are gross figures and do not include the cost of the offers. As an illustration, a $5 monthly credit given to all 1,307 customers would cost about $6,500 per month, which is close to the benefit at a 10% reduction and clearly profitable at 20% or more. The actual cost of the offers should be confirmed with the business before launch.

Assumptions: retained customers keep paying their current monthly charge for twelve months, the reduction percentages are scenarios rather than forecasts, and the three interventions target overlapping customers, so their impacts should not be added together.

## Validation plan

1. Randomly split the high-risk segment into a treatment group and a control group.
2. Apply the offer to the treatment group only and run for about 90 days.
3. Compare churn rate, revenue retained, and cost per customer retained between the two groups.
4. Expand the program only if the treatment group clearly outperforms the control.

A controlled test is needed because the analysis is observational. It cannot show that a given offer will reduce churn, only where churn is concentrated.

## Limitations

- **Association, not causation.** The data shows which customers churn, not why. Customers who choose longer contracts or add support services may already be more loyal, so the true effect of an intervention is likely smaller than the raw differences above.
- **Contract lock-in.** Part of the low churn on one-year and two-year contracts reflects customers being unable to leave during the term, not necessarily higher satisfaction.
- **Small groups.** Some cells are too small for firm conclusions. For example, two-year contracts in the first year of tenure contain only 68 customers.
- **Single snapshot.** The dataset has no dates beyond tenure, so trends over time and seasonality cannot be assessed.

## Next steps

1. Obtain cost estimates for the proposed offers and recompute net impact.
2. Run the segment test described above.
3. Survey fiber optic customers to identify the drivers of their higher churn.
4. Build a churn prediction model to score individual customers, which would allow targeting beyond the single high-risk segment.
