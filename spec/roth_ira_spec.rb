require 'spec_helper'

describe RothIRA do
  it 'should return correct version string' do
    expect(RothIRA::VERSION).to eq('0.0.2')
  end

  context 'Single' do
    it 'should return correct value for low income single' do
      expect(RothIRA.calculate_limit(1500, :single, 25)).to eq(1500)
    end

    it 'should return correct value for moderate income single' do
      expect(RothIRA.calculate_limit(75000, :single, 25)).to eq(5500)
    end

    it 'should return correct value for high income single' do
      expect(RothIRA.calculate_limit(135000, :single, 25)).to eq(0)
    end

    it 'should return correct value for phase-out income single' do
      expect(RothIRA.calculate_limit(122800, :single, 25)).to eq(3010)
    end

    context 'over 50' do
      it 'should return correct value for low income single over 50' do
        expect(RothIRA.calculate_limit(1500, :single, 50)).to eq(1500)
      end

      it 'should return correct value for moderate income single over 50' do
        expect(RothIRA.calculate_limit(75000, :single, 50)).to eq(6500)
      end

      it 'should return correct value for phase-out income single over 50' do
        expect(RothIRA.calculate_limit(121600, :single, 50)).to eq(4080)
      end
    end
  end

  context 'Married Filing Jointly' do
    it 'should return correct value for low income married filing jointly' do
      expect(RothIRA.calculate_limit(9900, :married_filing_jointly, 25, 26)).to eq(9900)
    end

    it 'should return correct value for moderate income married filing jointly' do
      expect(RothIRA.calculate_limit(135000, :married_filing_jointly, 25, 26)).to eq(11000)
    end

    it 'should return correct value for high income married filing jointly' do
      expect(RothIRA.calculate_limit(195000, :married_filing_jointly, 25, 26)).to eq(0)
    end

    it 'should return correct value for phase-out income married filing jointly' do
      expect(RothIRA.calculate_limit(189500, :married_filing_jointly, 25, 26)).to eq(3850)
    end

    context 'over 50' do
      it 'should return correct value for low income married filing jointly, with one over 50' do
        expect(RothIRA.calculate_limit(9900, :married_filing_jointly, 50, 49)).to eq(9900)
      end

      it 'should return correct value for moderate income married filing jointly, with one over 50' do
        expect(RothIRA.calculate_limit(135000, :married_filing_jointly, 50, 49)).to eq(12000)
      end

      it 'should return correct value for moderate income married filing jointly, with both over 50' do
        expect(RothIRA.calculate_limit(135000, :married_filing_jointly, 50, 51)).to eq(13000)
      end

      it 'should return correct value for phase-out income married filing jointly, with one over 50' do
        expect(RothIRA.calculate_limit(189500, :married_filing_jointly, 50, 49)).to eq(4200)
      end

      it 'should return correct value for phase-out income married filing jointly, with both over 50' do
        expect(RothIRA.calculate_limit(189500, :married_filing_jointly, 50, 65)).to eq(4550)
      end

      it 'should return correct value for high income married filing jointly, with both over 50' do
        expect(RothIRA.calculate_limit(195000, :married_filing_jointly, 55, 62)).to eq(0)
      end
    end
  end
end