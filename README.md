# roth-ira

This Ruby gem allows you to calculate maximum Roth IRA contributions based on Modified Adjusted Gross Income (MAGI), Age, Filing Status, and Tax Year. Guidelines for these calculations were taken from the [IRS Publications on Roth IRAs](http://www.irs.gov/Retirement-Plans/Roth-IRAs).

Contribution and income limits may vary every year, and thus changes to the code will be required. This gem is currently up to date for __Tax Year 2015__.

## Usage

First, you will need to require the gem.

```
require "roth_ira"
```

Next, call the method `RothIRA.calculate_limit` and pass four parameters: MAGI, filing status as a symbol (:single, :married_filing_jointly), age, and (optionally) spouse's age.

```
RothIRA.calculate_limit(75000, :single, 25)
> 5500
RothIRA.calculate_limit(75000, :married_filing_jointly, 49)
> 11000
RothIRA.calculate_limit(75000, :married_filing_jointly, 49, 50)
> 12000
```
