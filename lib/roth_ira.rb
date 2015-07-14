module RothIRA
  def self.calculate_limit(agi, filing_status, age, spouse_age = 0, year = 2015)
    lower_limit = limits[year][filing_status][:lower_income_limit]
    upper_limit = limits[year][filing_status][:upper_income_limit]
    max_contribution = calculate_max_contribution(filing_status, age, spouse_age, year)
    if agi < max_contribution
      agi
    elsif agi > max_contribution && agi < lower_limit
      max_contribution
    elsif agi > upper_limit
      0
    else
      excess_income = 1.0 * (agi - lower_limit)
      ratio = (excess_income/(upper_limit - lower_limit)).round(3)
      (max_contribution * (1-ratio)).round(-1)
    end
  end

  private
  def self.limits
    { 
      2015 => {
        single: {
          lower_income_limit: 116000,
          upper_income_limit: 131000,
          contribution_limit: 5500
        },
        married_filing_jointly: {
          lower_income_limit: 183000,
          upper_income_limit: 193000,
          contribution_limit: 11000
        },
        catch_up_contribution: 1000,
        catch_up_age: 50
      }
    }
  end

  def self.calculate_max_contribution(filing_status, age, spouse_age, year)
    contribution_amount = limits[year][filing_status][:contribution_limit]
    catch_up_age = limits[year][:catch_up_age]
    if age >= catch_up_age
      contribution_amount += limits[year][:catch_up_contribution]
    end
    if filing_status == :married_filing_jointly && spouse_age > catch_up_age
      contribution_amount += limits[year][:catch_up_contribution]
    end
    return contribution_amount
  end
end