require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe E164 do
  it 'should set ValidFormat to regex that validates e164' do
    '+13035559850'.should =~ E164::ValidFormat
  end
  
  it 'should set DefaultCountryCode to 1(NANP)' do
    E164::DefaultCountryCode.should == '1'
  end

  describe '#set_default_country_code!' do
    it 'should override DefaultCountryCode' do
      original = E164.set_default_country_code!('44')
      begin
        E164::DefaultCountryCode.should == '44'
      ensure
        # set back original DefaultCountryCode's value
        E164.set_default_country_code!(original)
      end
    end
  end

  describe '#set_default_country_length!' do
    it 'should override DefaultCountryLength' do
      original = E164.set_default_country_length!('12')
      begin
        E164::DefaultCountryLength.should == '12'
      ensure
        # set back original DefaultCountryLength's value
        E164.set_default_country_length!(original)
      end
    end
  end
  
  describe '#normalize' do
    it 'should remove all non-numeric punctuation except the e164 identifier prefix' do
      E164.normalize('+1 (303) 555-9850').should == '+13035559850'
    end
    
    it 'should add default country code if no country code e164 identifier is found.' do
      E164.normalize('3035559850').should == "+13035559850"
    end

    it 'should not add default country code if the number is longer than default country length' do
      E164.normalize('447966845555').should == '+447966845555'
    end
    
    it 'should not add country code if it already starts with the default country code and no identifier' do
      E164.normalize('13035559850').should == "+13035559850"
    end
    
    it "shouldn't die on german numbers" do
      lambda { E164.normalize('+4988612345670') }.should_not raise_error
    end

    it 'should handle 00 identifier' do
      E164.normalize('00441234567890').should == '+441234567890'
    end
  end

  describe "#parse" do
    CountryCodes.each do |code, data|
      it "should pick up the correct country code for #{data[:description]} when in + format" do
        # Create a false number in + format because the code provided is correct
        fake_number = "+#{code}1234567"
        E164.parse(fake_number)[0].should == code
      end
    end
  end
end
