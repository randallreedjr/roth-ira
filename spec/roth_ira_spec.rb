require 'spec_helper'

describe RothIRA do
  it 'should return correct version string' do
    expect(RothIRA::VERSION).to eq('0.0.1')
  end

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

  it 'should return correct value for moderate income single over 50' do
    expect(RothIRA.calculate_limit(75000, :single, 50)).to eq(6500)
  end
end