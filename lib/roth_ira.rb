require 'roth_ira_limits'

# Class to calculate max Roth IRA Contribution
# Utilizes tax year, agi, filing status, and age to determine limit
class RothIRA
  attr_reader :year, :agi, :filing_status, :age, :spouse_age

  def initialize(year)
    @year = year
  end

  def calculate(agi, filing_status, *ages)
    @agi = agi
    @filing_status = filing_status
    @age = ages.first
    @spouse_age = ages.size == 2 ? ages.last : 0

    calculate_limit
  end

  private

  def calculate_limit
    case agi
    when 0..max_contribution then agi
    when max_contribution..lower_limit then max_contribution
    when lower_limit...upper_limit then calculate_phase_out
    else 0
    end
  end

  def lower_limit
    RothIRALimits.limits[year][filing_status][:lower_income_limit]
  end

  def upper_limit
    RothIRALimits.limits[year][filing_status][:upper_income_limit]
  end

  def max_contribution
    contribution_limit + calculate_catch_up
  end

  def catch_up_age
    RothIRALimits.limits[year][:catch_up_age]
  end

  def catch_up_contribution
    RothIRALimits.limits[year][:catch_up_contribution]
  end

  def contribution_limit
    RothIRALimits.limits[year][filing_status][:contribution_limit]
  end

  def minimum_phase_out
    RothIRALimits.limits[year][filing_status][:minimum_phase_out]
  end

  def calculate_catch_up
    eligible = [primary_eligible_catch_up, spouse_eligible_catch_up]
    eligible.count(true) * catch_up_contribution
  end

  def primary_eligible_catch_up
    age >= catch_up_age
  end

  def spouse_eligible_catch_up
    filing_status == :married_filing_jointly && spouse_age > catch_up_age
  end

  def calculate_phase_out
    excess_income = (agi - lower_limit).to_f
    ratio = 1 - (excess_income / limit_range).round(3)
    phase_out_amount = nearest_10(max_contribution * ratio)
    minimum_200 phase_out_amount
  end

  def limit_range
    upper_limit - lower_limit
  end

  def nearest_10(amount)
    # IRS instructions are to round contribution limit UP to the nearest $10
    (amount.to_f / 10).ceil * 10
  end

  def minimum_200(amount)
    # IRS allows minimum contribution of $200 in phase-out range (per person)
    amount < minimum_phase_out ? minimum_phase_out : amount
  end
end
