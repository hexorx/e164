require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe E164 do
  it 'should set ValidFormat to regex that validates e164' do
    '+13035559850'.should =~ E164::ValidFormat
  end
  
  it 'should set DefaultCountryCode to 1(NANP)' do
    E164::DefaultCountryCode.should == '1'
  end
  
  describe '#normalize' do
    it 'should remove all non-numeric punctuation except the e164 identifier prefix' do
      E164.normalize('+1 (303) 555-9850').should == '+13035559850'
    end
    
    it 'should add default country code if no country code e164 identifier is found.' do
      E164.normalize('3035559850').should == "+13035559850"
    end
    
    it 'should not add country code if it already starts with the default country code and no identifier' do
      E164.normalize('13035559850').should == "+13035559850"
    end
    
    it "shouldn't die on german numbers" do
      lambda { E164.normalize('+4988612345670') }.should_not raise_error
    end
  end
end
