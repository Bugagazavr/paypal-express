require 'spec_helper.rb'

describe Paypal::Util do
  describe '.formatted_amount' do
    it 'should return String in "xx.yy" format' do
      expect(Paypal::Util.formatted_amount(nil)).to eq('0.00')
      expect(Paypal::Util.formatted_amount(10)).to eq('10.00')
      expect(Paypal::Util.formatted_amount(10.02)).to eq('10.02')
      expect(Paypal::Util.formatted_amount(10.2)).to eq('10.20')
      expect(Paypal::Util.formatted_amount(10.24)).to eq('10.24')
      expect(Paypal::Util.formatted_amount(10.255)).to eq('10.25')
    end
  end

  describe '.to_numeric' do
    it 'should return Numeric' do
      expect(Paypal::Util.to_numeric('10')).to be_kind_of(Integer)
      expect(Paypal::Util.to_numeric('10.5')).to be_kind_of(Float)
      expect(Paypal::Util.to_numeric('-1.5')).to eq(-1.5)
      expect(Paypal::Util.to_numeric('-1')).to eq(-1)
      expect(Paypal::Util.to_numeric('0')).to eq(0)
      expect(Paypal::Util.to_numeric('0.00')).to eq(0)
      expect(Paypal::Util.to_numeric('10')).to eq(10)
      expect(Paypal::Util.to_numeric('10.00')).to eq(10)
      expect(Paypal::Util.to_numeric('10.02')).to eq(10.02)
      expect(Paypal::Util.to_numeric('10.2')).to eq(10.2)
      expect(Paypal::Util.to_numeric('10.20')).to eq(10.2)
      expect(Paypal::Util.to_numeric('10.24')).to eq(10.24)
      expect(Paypal::Util.to_numeric('10.25')).to eq(10.25)
    end
  end
end
