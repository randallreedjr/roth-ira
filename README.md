[![CircleCI](https://circleci.com/gh/randallreedjr/roth_ira.svg?style=shield)](https://circleci.com/gh/randallreedjr/roth_ira)
[![Gem Version](https://badge.fury.io/rb/roth_ira.svg)](https://badge.fury.io/rb/roth_ira)
[![Code Climate](https://codeclimate.com/github/randallreedjr/roth_ira/badges/gpa.svg)](https://codeclimate.com/github/randallreedjr/roth_ira)

# roth_ira

This Ruby gem allows you to calculate maximum Roth IRA contributions based on Modified Adjusted Gross Income (MAGI), Age, Filing Status, and Tax Year. Guidelines for these calculations were taken from the [IRS Publications on Roth IRAs](https://www.irs.gov/retirement-plans/roth-iras).

Contribution and income limits may vary every year, and thus changes to the code will be required. This gem is currently up to date for __Tax Years 2015 - 2017__.

## Installation

In your gemfile, add
```
gem 'roth_ira', '~> 1.2.0'
```
then run `bundle install`.

Alternatively, you can manually install the gem.
```
gem install roth_ira
```

## Usage
### Version 1.0+
To calculate a contribution limit, initialize a new RothIRA object with the tax year. Then, call `calculate_limit`, and pass MAGI, filing status, age, and (optionally) spouse age.
```
> roth_ira = RothIRA.new(2017)
> roth_ira.calculate(75000, :single, 25)
5500
> RothIRA.calculate(75000, :married_filing_jointly, 25)
11000
```

### Older versions
Next, call the method `RothIRA.calculate_limit` and pass four parameters: MAGI, filing status as a symbol (:single, :married_filing_jointly), age, and (optionally) spouse's age.

```
RothIRA.calculate_limit(75000, :single, 25)
> 5500
RothIRA.calculate_limit(75000, :married_filing_jointly, 49)
> 11000
RothIRA.calculate_limit(75000, :married_filing_jointly, 49, 50)
> 12000
```

## Version Note
roth_ira follows semantic versioning. New with version 1.0.0, year is no longer an optional parameter and must be specified. Additionally, implementation has shifted from module methods to class instance methods.
