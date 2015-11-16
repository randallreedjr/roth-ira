# Contribution limits for filing statuses and valid tax years
class RothIRALimits
  def self.limits
    {
      2015 => limits_2015,
      2016 => limits_2016
    }
  end

  private_class_method

  def self.limits_2015
    [
      limits_2015_single,
      limits_2015_head_of_household,
      limits_2015_married_filing_jointly,
      limits_catch_up_contribution,
      limits_catch_up_age
    ].inject(&:merge)
  end

  def self.limits_2015_single
    {
      single: {
        lower_income_limit: 116_000,
        upper_income_limit: 131_000,
        contribution_limit: 5_500,
        minimum_phase_out: 200
      }
    }
  end

  def self.limits_2015_head_of_household
    {
      head_of_household: {
        lower_income_limit: 116_000,
        upper_income_limit: 131_000,
        contribution_limit: 5_500,
        minimum_phase_out: 200
      }
    }
  end

  def self.limits_2015_married_filing_jointly
    {
      married_filing_jointly: {
        lower_income_limit: 183_000,
        upper_income_limit: 193_000,
        contribution_limit: 11_000,
        minimum_phase_out: 400
      }
    }
  end

  def self.limits_catch_up_contribution
    {
      catch_up_contribution: 1_000
    }
  end

  def self.limits_catch_up_age
    {
      catch_up_age: 50
    }
  end

  def self.limits_2016
    [
      limits_2016_single,
      limits_2016_head_of_household,
      limits_2016_married_filing_jointly,
      limits_catch_up_contribution,
      limits_catch_up_age
    ].inject(&:merge)
  end

  def self.limits_2016_single
    {
      single: {
        lower_income_limit: 117_000,
        upper_income_limit: 132_000,
        contribution_limit: 5_500,
        minimum_phase_out: 200
      }
    }
  end

  def self.limits_2016_head_of_household
    {
      head_of_household: {
        lower_income_limit: 117_000,
        upper_income_limit: 132_000,
        contribution_limit: 5_500,
        minimum_phase_out: 200
      }
    }
  end

  def self.limits_2016_married_filing_jointly
    {
      married_filing_jointly: {
        lower_income_limit: 184_000,
        upper_income_limit: 194_000,
        contribution_limit: 11_000,
        minimum_phase_out: 400
      }
    }
  end
end
