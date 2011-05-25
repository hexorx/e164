module E164
  
  Dir.glob(File.join(File.dirname(__FILE__), 'e164/*.rb')).each {|f| require f }
  
  ValidFormat = /^\+([\d]{1,3})([\d]{1,14})$/
  Identifiers = ['+','011', '00']
  DefaultIdentifier = '+'
  DefaultCountryCode = '1'
  
  def self.normalize(num)
    parse(num).unshift(DefaultIdentifier).join
  end
  
  def self.parse(num)
    num = e164_clean(num)
    identifier = Identifiers.include?(num.first) ? num.shift : nil
    
    num = (identifier || num.join.start_with?(DefaultCountryCode)) ? join_country_code(num) : num.unshift(DefaultCountryCode)
    num = join_national_destination_code(num)
    
    [num.shift,num.shift,num.join]
  end
  
  def self.e164_clean(num)
    num.scan(/^(?:#{Identifiers.map{|i| Regexp.escape(i) }.join('|')})|[\d]/)
  end
  
  def self.join_country_code(num)
    potentials = (1..3).map {|l| num[0,l].join}
    country_code = potentials.map {|x| CountryCodes[x] ? x : nil}.compact.first

    unless country_code
      country_code = DefaultCountryCode
      num.unshift(country_code)
    end
    
    [num.shift(country_code.length).join, *num]
  end
  
  def self.join_national_destination_code(num)
    country = CountryCodes[num[0]]
    
    case (destination_codes = country[:national_destination_codes])
    when Integer
      destination_code_length = destination_codes
    when Hash
      potentials = destination_codes[:range].map {|l| num[1,l].join}
      destination_code = potentials.map {|x| destination_codes[x] ? x : nil}.compact.first
      destination_code_length = (destination_code && destination_code.length) || destination_codes[:default]
    end
    
    [num.shift, num.shift(destination_code_length).join, *num]
  end
end
