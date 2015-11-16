require 'spec_helper'

describe RothIRA do
  it 'returns correct version string' do
    expect(RothIRA::VERSION).to eq('1.0.0')
  end

  context 'Tax year 2015' do
    let(:roth_ira) { RothIRA.new(2015) }
    context 'Single' do
      it 'returns correct value for low income' do
        result = roth_ira.calculate(1_500, :single, 25)
        expect(result).to eq(1500)
      end

      it 'returns correct value for moderate income' do
        result = roth_ira.calculate(75_000, :single, 25)
        expect(result).to eq(5500)
      end

      it 'returns correct value for high income' do
        result = roth_ira.calculate(135_000, :single, 25)
        expect(result).to eq(0)
      end

      it 'returns correct value for phase-out income' do
        result = roth_ira.calculate(122_800, :single, 25)
        expect(result).to eq(3_010)
      end

      it 'correctly handles minimum phase out amount of $200' do
        result = roth_ira.calculate(130_900, :single, 25)
        expect(result).to eq(200)
      end

      context 'over 50' do
        it 'returns correct value for low income' do
          result = roth_ira.calculate(1_500, :single, 50)
          expect(result).to eq(1_500)
        end

        it 'returns correct value for moderate income' do
          result = roth_ira.calculate(75_000, :single, 50)
          expect(result).to eq(6_500)
        end

        it 'returns correct value for phase-out income' do
          result = roth_ira.calculate(121_600, :single, 50)
          expect(result).to eq(4_080)
        end
      end
    end

    context 'Head of Household' do
      it 'returns correct value for low income' do
        result = roth_ira.calculate(1_500, :head_of_household, 25)
        expect(result).to eq(1_500)
      end

      it 'returns correct value for moderate income' do
        result = roth_ira.calculate(75_000, :head_of_household, 25)
        expect(result).to eq(5_500)
      end

      it 'returns correct value for high income' do
        result = roth_ira.calculate(135_000, :head_of_household, 25)
        expect(result).to eq(0)
      end

      it 'returns correct value for phase-out income' do
        result = roth_ira.calculate(122_800, :head_of_household, 25)
        expect(result).to eq(3_010)
      end

      it 'correctly handles minimum phase out amount of $200' do
        result = roth_ira.calculate(130_900, :head_of_household, 25)
        expect(result).to eq(200)
      end

      context 'over 50' do
        it 'returns correct value for low income' do
          result = roth_ira.calculate(1_500, :head_of_household, 50)
          expect(result).to eq(1_500)
        end

        it 'returns correct value for moderate income' do
          result = roth_ira.calculate(75_000, :head_of_household, 50)
          expect(result).to eq(6_500)
        end

        it 'returns correct value for phase-out income' do
          result = roth_ira.calculate(121_600, :head_of_household, 50)
          expect(result).to eq(4_080)
        end
      end
    end

    context 'Married Filing Jointly' do
      it 'returns correct value for low income' do
        result = roth_ira.calculate(9_900, :married_filing_jointly, 25, 26)
        expect(result).to eq(9_900)
      end

      it 'returns correct value for moderate income' do
        result = roth_ira.calculate(135_000, :married_filing_jointly, 25, 26)
        expect(result).to eq(11_000)
      end

      it 'returns correct value for high income' do
        result = roth_ira.calculate(195_000, :married_filing_jointly, 25, 26)
        expect(result).to eq(0)
      end

      it 'returns correct value for phase-out income' do
        result = roth_ira.calculate(189_500, :married_filing_jointly, 25, 26)
        expect(result).to eq(3_850)
      end

      context 'over 50' do
        it 'returns correct value for low income, with one over 50' do
          result = roth_ira.calculate(9_900, :married_filing_jointly, 50, 49)
          expect(result).to eq(9_900)
        end

        it 'returns correct value for moderate income, with one over 50' do
          result = roth_ira.calculate(135_000, :married_filing_jointly, 50, 49)
          expect(result).to eq(12_000)
        end

        it 'returns correct value for moderate income, with both over 50' do
          result = roth_ira.calculate(135_000, :married_filing_jointly, 50, 51)
          expect(result).to eq(13_000)
        end

        it 'returns correct value for phase-out income, with one over 50' do
          result = roth_ira.calculate(189_500, :married_filing_jointly, 50, 49)
          expect(result).to eq(4_200)
        end

        it 'returns correct value for phase-out income, with both over 50' do
          result = roth_ira.calculate(189_500, :married_filing_jointly, 50, 65)
          expect(result).to eq(4_550)
        end

        it 'returns correct value for high income, with both over 50' do
          result = roth_ira.calculate(195_000, :married_filing_jointly, 55, 62)
          expect(result).to eq(0)
        end
      end
    end
  end

  context 'Tax year 2016' do
    let(:roth_ira) { RothIRA.new(2016) }
    context 'Single' do
      it 'returns correct value for low income' do
        result = roth_ira.calculate(1_500, :single, 25)
        expect(result).to eq(1_500)
      end

      it 'returns correct value for moderate income' do
        result = roth_ira.calculate(75_000, :single, 25)
        expect(result).to eq(5_500)
      end

      it 'returns correct value for high income' do
        result = roth_ira.calculate(135_000, :single, 25)
        expect(result).to eq(0)
      end

      it 'returns correct value for phase-out income' do
        result = roth_ira.calculate(122_800, :single, 25)
        expect(result).to eq(3_380)
      end

      it 'correctly handles minimum phase out amount of $200' do
        result = roth_ira.calculate(131_900, :single, 25)
        expect(result).to eq(200)
      end

      context 'over 50' do
        it 'returns correct value for low income' do
          result = roth_ira.calculate(1_500, :single, 50)
          expect(result).to eq(1_500)
        end

        it 'returns correct value for moderate income' do
          result = roth_ira.calculate(75_000, :single, 50)
          expect(result).to eq(6_500)
        end

        it 'returns correct value for phase-out income' do
          result = roth_ira.calculate(121_600, :single, 50)
          expect(result).to eq(4_510)
        end
      end
    end

    context 'Head of Household' do
      it 'returns correct value for low income' do
        result = roth_ira.calculate(1_500, :head_of_household, 25)
        expect(result).to eq(1_500)
      end

      it 'returns correct value for moderate income' do
        result = roth_ira.calculate(75_000, :head_of_household, 25)
        expect(result).to eq(5_500)
      end

      it 'returns correct value for high income' do
        result = roth_ira.calculate(135_000, :head_of_household, 25)
        expect(result).to eq(0)
      end

      it 'returns correct value for phase-out income' do
        result = roth_ira.calculate(122_800, :head_of_household, 25)
        expect(result).to eq(3_380)
      end

      it 'correctly handles minimum phase out amount of $200' do
        result = roth_ira.calculate(131_900, :head_of_household, 25)
        expect(result).to eq(200)
      end

      context 'over 50' do
        it 'returns correct value for low income' do
          result = roth_ira.calculate(1_500, :head_of_household, 50)
          expect(result).to eq(1_500)
        end

        it 'returns correct value for moderate income' do
          result = roth_ira.calculate(75_000, :head_of_household, 50)
          expect(result).to eq(6_500)
        end

        it 'returns correct value for phase-out income' do
          result = roth_ira.calculate(121_600, :head_of_household, 50)
          expect(result).to eq(4_510)
        end
      end
    end

    context 'Married Filing Jointly' do
      it 'returns correct value for low income' do
        result = roth_ira.calculate(9_900, :married_filing_jointly, 25, 26)
        expect(result).to eq(9_900)
      end

      it 'returns correct value for moderate income' do
        result = roth_ira.calculate(135_000, :married_filing_jointly, 25, 26)
        expect(result).to eq(11_000)
      end

      it 'returns correct value for high income' do
        result = roth_ira.calculate(195_000, :married_filing_jointly, 25, 26)
        expect(result).to eq(0)
      end

      it 'returns correct value for phase-out income' do
        result = roth_ira.calculate(189_500, :married_filing_jointly, 25, 26)
        expect(result).to eq(4_950)
      end

      context 'over 50' do
        it 'returns correct value for low income, with one over 50' do
          result = roth_ira.calculate(9_900, :married_filing_jointly, 50, 49)
          expect(result).to eq(9_900)
        end

        it 'returns correct value for moderate income, with one over 50' do
          result = roth_ira.calculate(135_000, :married_filing_jointly, 50, 49)
          expect(result).to eq(12_000)
        end

        it 'returns correct value for moderate income, with both over 50' do
          result = roth_ira.calculate(135_000, :married_filing_jointly, 50, 51)
          expect(result).to eq(13_000)
        end

        it 'returns correct value for phase-out income, with one over 50' do
          result = roth_ira.calculate(189_500, :married_filing_jointly, 50, 49)
          expect(result).to eq(5_400)
        end

        it 'returns correct value for phase-out income, with both over 50' do
          result = roth_ira.calculate(189_500, :married_filing_jointly, 50, 65)
          expect(result).to eq(5_850)
        end

        it 'returns correct value for high income, with both over 50' do
          result = roth_ira.calculate(195_000, :married_filing_jointly, 55, 62)
          expect(result).to eq(0)
        end

        it 'correctly handles minimum phase out amount of $200' do
          result = roth_ira.calculate(193_900, :married_filing_jointly, 55, 62)
          expect(result).to eq(400)
        end
      end
    end
  end
end
