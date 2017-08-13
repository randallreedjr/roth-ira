require 'spec_helper'

describe RothIRA do
  it 'should return correct version string' do
    expect(RothIRA::VERSION).to eq('1.2.0')
  end

  context 'Tax year 2015' do
    let(:roth_ira) { RothIRA.new(2015) }
    context 'Single' do
      it 'should return correct value for low income single' do
        expect(roth_ira.calculate(1500, :single, 25)).to eq(1500)
      end

      it 'should return correct value for moderate income single' do
        expect(roth_ira.calculate(75000, :single, 25)).to eq(5500)
      end

      it 'should return correct value for high income single' do
        expect(roth_ira.calculate(135000, :single, 25)).to eq(0)
      end

      it 'should return correct value for phase-out income single' do
        expect(roth_ira.calculate(122800, :single, 25)).to eq(3010)
      end

      it 'should correctly handle minimum phase out amount of $200' do
        expect(roth_ira.calculate(130900, :single, 25)).to eq(200)
      end

      context 'over 50' do
        it 'should return correct value for low income single over 50' do
          expect(roth_ira.calculate(1500, :single, 50)).to eq(1500)
        end

        it 'should return correct value for moderate income single over 50' do
          expect(roth_ira.calculate(75000, :single, 50)).to eq(6500)
        end

        it 'should return correct value for phase-out income single over 50' do
          expect(roth_ira.calculate(121600, :single, 50)).to eq(4080)
        end
      end
    end

    context 'Head of Household' do
      it 'should return correct value for low income head of household' do
        expect(roth_ira.calculate(1500, :head_of_household, 25)).to eq(1500)
      end

      it 'should return correct value for moderate income head of household' do
        expect(roth_ira.calculate(75000, :head_of_household, 25)).to eq(5500)
      end

      it 'should return correct value for high income head of household' do
        expect(roth_ira.calculate(135000, :head_of_household, 25)).to eq(0)
      end

      it 'should return correct value for phase-out income head of household' do
        expect(roth_ira.calculate(122800, :head_of_household, 25)).to eq(3010)
      end

      it 'should correctly handle minimum phase out amount of $200' do
        expect(roth_ira.calculate(130900, :head_of_household, 25)).to eq(200)
      end

      context 'over 50' do
        it 'should return correct value for low income head of household over 50' do
          expect(roth_ira.calculate(1500, :head_of_household, 50)).to eq(1500)
        end

        it 'should return correct value for moderate income head of household over 50' do
          expect(roth_ira.calculate(75000, :head_of_household, 50)).to eq(6500)
        end

        it 'should return correct value for phase-out income head of household over 50' do
          expect(roth_ira.calculate(121600, :head_of_household, 50)).to eq(4080)
        end
      end
    end

    context 'Married Filing Jointly' do
      it 'should return correct value for low income married filing jointly' do
        expect(roth_ira.calculate(9900, :married_filing_jointly, 25, 26)).to eq(9900)
      end

      it 'should return correct value for moderate income married filing jointly' do
        expect(roth_ira.calculate(135000, :married_filing_jointly, 25, 26)).to eq(11000)
      end

      it 'should return correct value for high income married filing jointly' do
        expect(roth_ira.calculate(195000, :married_filing_jointly, 25, 26)).to eq(0)
      end

      it 'should return correct value for phase-out income married filing jointly' do
        expect(roth_ira.calculate(189500, :married_filing_jointly, 25, 26)).to eq(3850)
      end

      context 'over 50' do
        it 'should return correct value for low income married filing jointly, with one over 50' do
          expect(roth_ira.calculate(9900, :married_filing_jointly, 50, 49)).to eq(9900)
        end

        it 'should return correct value for moderate income married filing jointly, with one over 50' do
          expect(roth_ira.calculate(135000, :married_filing_jointly, 50, 49)).to eq(12000)
        end

        it 'should return correct value for moderate income married filing jointly, with both over 50' do
          expect(roth_ira.calculate(135000, :married_filing_jointly, 50, 51)).to eq(13000)
        end

        it 'should return correct value for phase-out income married filing jointly, with one over 50' do
          expect(roth_ira.calculate(189500, :married_filing_jointly, 50, 49)).to eq(4200)
        end

        it 'should return correct value for phase-out income married filing jointly, with both over 50' do
          expect(roth_ira.calculate(189500, :married_filing_jointly, 50, 65)).to eq(4550)
        end

        it 'should return correct value for high income married filing jointly, with both over 50' do
          expect(roth_ira.calculate(195000, :married_filing_jointly, 55, 62)).to eq(0)
        end
      end
    end
  end

  context 'Tax year 2016' do
    let(:roth_ira) { RothIRA.new(2016) }
    context 'Single' do
      it 'should return correct value for low income single' do
        expect(roth_ira.calculate(1500, :single, 25)).to eq(1500)
      end

      it 'should return correct value for moderate income single' do
        expect(roth_ira.calculate(75000, :single, 25)).to eq(5500)
      end

      it 'should return correct value for high income single' do
        expect(roth_ira.calculate(135000, :single, 25)).to eq(0)
      end

      it 'should return correct value for phase-out income single' do
        expect(roth_ira.calculate(122800, :single, 25)).to eq(3380)
      end

      it 'should correctly handle minimum phase out amount of $200' do
        expect(roth_ira.calculate(131900, :single, 25)).to eq(200)
      end

      context 'over 50' do
        it 'should return correct value for low income single over 50' do
          expect(roth_ira.calculate(1500, :single, 50)).to eq(1500)
        end

        it 'should return correct value for moderate income single over 50' do
          expect(roth_ira.calculate(75000, :single, 50)).to eq(6500)
        end

        it 'should return correct value for phase-out income single over 50' do
          expect(roth_ira.calculate(121600, :single, 50)).to eq(4510)
        end
      end
    end

    context 'Head of Household' do
      it 'should return correct value for low income head of household' do
        expect(roth_ira.calculate(1500, :head_of_household, 25)).to eq(1500)
      end

      it 'should return correct value for moderate income head of household' do
        expect(roth_ira.calculate(75000, :head_of_household, 25)).to eq(5500)
      end

      it 'should return correct value for high income head of household' do
        expect(roth_ira.calculate(135000, :head_of_household, 25)).to eq(0)
      end

      it 'should return correct value for phase-out income head of household' do
        expect(roth_ira.calculate(122800, :head_of_household, 25)).to eq(3380)
      end

      it 'should correctly handle minimum phase out amount of $200' do
        expect(roth_ira.calculate(131900, :head_of_household, 25)).to eq(200)
      end

      context 'over 50' do
        it 'should return correct value for low income head of household over 50' do
          expect(roth_ira.calculate(1500, :head_of_household, 50)).to eq(1500)
        end

        it 'should return correct value for moderate income head of household over 50' do
          expect(roth_ira.calculate(75000, :head_of_household, 50)).to eq(6500)
        end

        it 'should return correct value for phase-out income head of household over 50' do
          expect(roth_ira.calculate(121600, :head_of_household, 50)).to eq(4510)
        end
      end
    end

    context 'Married Filing Jointly' do
      it 'should return correct value for low income married filing jointly' do
        expect(roth_ira.calculate(9900, :married_filing_jointly, 25, 26)).to eq(9900)
      end

      it 'should return correct value for moderate income married filing jointly' do
        expect(roth_ira.calculate(135000, :married_filing_jointly, 25, 26)).to eq(11000)
      end

      it 'should return correct value for high income married filing jointly' do
        expect(roth_ira.calculate(195000, :married_filing_jointly, 25, 26)).to eq(0)
      end

      it 'should return correct value for phase-out income married filing jointly' do
        expect(roth_ira.calculate(189500, :married_filing_jointly, 25, 26)).to eq(4950)
      end

      context 'over 50' do
        it 'should return correct value for low income married filing jointly, with one over 50' do
          expect(roth_ira.calculate(9900, :married_filing_jointly, 50, 49)).to eq(9900)
        end

        it 'should return correct value for moderate income married filing jointly, with one over 50' do
          expect(roth_ira.calculate(135000, :married_filing_jointly, 50, 49)).to eq(12000)
        end

        it 'should return correct value for moderate income married filing jointly, with both over 50' do
          expect(roth_ira.calculate(135000, :married_filing_jointly, 50, 51)).to eq(13000)
        end

        it 'should return correct value for phase-out income married filing jointly, with one over 50' do
          expect(roth_ira.calculate(189500, :married_filing_jointly, 50, 49)).to eq(5400)
        end

        it 'should return correct value for phase-out income married filing jointly, with both over 50' do
          expect(roth_ira.calculate(189500, :married_filing_jointly, 50, 65)).to eq(5850)
        end

        it 'should return correct value for high income married filing jointly, with both over 50' do
          expect(roth_ira.calculate(195000, :married_filing_jointly, 55, 62)).to eq(0)
        end

        it 'should correctly handle minimum phase out amount of $200' do
          expect(roth_ira.calculate(193900, :married_filing_jointly, 55, 62)).to eq(400)
        end
      end
    end
  end

  context 'Tax year 2017' do
    let(:roth_ira) { RothIRA.new(2017) }
    context 'Single' do
      it 'returns maximum contribution for bottom of income limit' do
        expect(roth_ira.calculate(118000, :single, 40)).to eq(5500)
      end

      it 'returns maximum contribution for bottom of income limit with catch-up' do
        expect(roth_ira.calculate(118000, :single, 50)).to eq(6500)
      end

      it 'returns zero contribution for top of income limit' do
        expect(roth_ira.calculate(133000, :single, 40)).to eq(0)
      end

      it 'returns maximum contribution for bottom of income limit with catch-up' do
        expect(roth_ira.calculate(133000, :single, 50)).to eq(0)
      end
    end

    context 'Head of Household' do
      it 'returns maximum contribution for bottom of income limit' do
        expect(roth_ira.calculate(118000, :head_of_household, 40)).to eq(5500)
      end

      it 'returns maximum contribution for bottom of income limit with catch-up' do
        expect(roth_ira.calculate(118000, :head_of_household, 50)).to eq(6500)
      end

      it 'returns zero contribution for top of income limit' do
        expect(roth_ira.calculate(133000, :head_of_household, 40)).to eq(0)
      end

      it 'returns maximum contribution for bottom of income limit with catch-up' do
        expect(roth_ira.calculate(133000, :head_of_household, 50)).to eq(0)
      end
    end

    context 'Married Filing Jointly' do
      it 'returns maximum contribution for bottom of income limit' do
        expect(roth_ira.calculate(186000, :married_filing_jointly, 40, 40)).to eq(11000)
      end

      it 'returns maximum contribution for bottom of income limit with one catch-up' do
        expect(roth_ira.calculate(186000, :married_filing_jointly, 40, 50)).to eq(12000)
      end

      it 'returns maximum contribution for bottom of income limit with both catch-up' do
        expect(roth_ira.calculate(186000, :married_filing_jointly, 50, 50)).to eq(13000)
      end

      it 'returns zero contribution for top of income limit' do
        expect(roth_ira.calculate(196000, :married_filing_jointly, 40, 40)).to eq(0)
      end

      it 'returns maximum contribution for bottom of income limit with one catch-up' do
        expect(roth_ira.calculate(196000, :married_filing_jointly, 40, 50)).to eq(0)
      end

      it 'returns maximum contribution for bottom of income limit with both catch-up' do
        expect(roth_ira.calculate(196000, :married_filing_jointly, 50, 50)).to eq(0)
      end
    end
  end
end
