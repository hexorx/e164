E164
====

E164 is a standard for formatting and routing international phone numbers. The goal of this gem is to make working with these numbers simpler. The E164 standard is composed of the following parts:

* International Access Code (IAC)
* Country Code (CC)
* National Destination Code (NDC)
* Subscriber Number (SN)

Right now the gem has the ability to parse out these 4 fields and normalize them to a standard format. It also contains country information scraped from wikipedia. Information has been scraped for the North American Numbering Plan (NANP), Austria and Germany as well. Right now this is just basic information and I hope to expand it in the future.

Warning!
--------

This gem is both incomplete and very US/NANP centric. So check the results before using in production. If you have information on formatting or route data either fork and add it or contact me. The biggest challenge is going to be keeping data used for parsing up to date.

Installation
------------

E164 is hosted on GemCutter, so simply run the following:

    gem sources -a http://gemcutter.org
    sudo gem install e164
    
Use It!
-------

E164 contains two main methods on the E164 module. The *parse* method takes a phone number as a string and returns an array containing CC,NDC and SN. If no IAC is found a default country is presumed. Right now the IAC's looked for are ['+','011'] and the default CC is 1 (NANP). Options to override the defaults will be coming soon.

    E164.parse('3035559850') #=> ['1','303','5559850']
    E164.parse('13035559850') #=> ['1','303','5559850']
    E164.parse('+203035559850') #=> ['20','30','35559850']
    E164.parse('011203035559850') #=> ['20','30','35559850']
    
The *normalize* method also takes a number as a string but returns it in the standard format. All it is really doing is parsing it and then joining the pieces.

    E164.normalize('3035559850') #=> '+13035559850'
    E164.normalize('13035559850') #=> '+13035559850'
    E164.normalize('+203035559850') #=> '+203035559850'
    E164.normalize('011203035559850') #=> '+203035559850'
    
Country info is stored in a hash of hashes with the CC being the key.

    E164::CountryCodes['1'] #=> {:national_destination_codes => 3, :abbreviation => 'NANP', :description => 'North American Numbering Plan', :info => 'en.wikipedia.com.org/wiki/NANP'}
    
NDC information is available for:

* NANP
* Austria
* Germany

Just like the CountryCodes, NDC info is stored in a hash of hashes and accessed through a constant. Some NDCs will have more information than others.

    E164::NANP('303') #=> {:abbreviation => 'Colorado', :description => '[Colorado] (Boulder, Longmont, Aurora, Denver and central Colorado, overlays with [720])', :info => 'en.wikipedia.com.org/wiki/Area_codes_303_and_720'}
    
    E164::Austria['1'] => {:description => 'Wient'}
    
    E164::Germany['10'] => {:description => 'Call-By-Call'}

ToDo
----

* Country specific formatting
* Add overrides for default options
* Add data for more areas
* Link to additional info for countries (currency, timezone, etc.)

Sponsored By
------------
This gem is sponsored by [Teliax][]. [Teliax][] makes business class Voice, [Centrex][](Including Hosted: IVRs, Ring Groups, Extensions and Day Night Mode) and Data services accessible to anyone. You don't have to be a fortune 500 to sound big!

Note on Patches/Pull Requests
-----------------------------
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but
   bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

Copyright
---------

Copyright (c) 2009 hexorx. See LICENSE for details.


[Teliax]: http://teliax.com
[Centrex]: http://en.wikipedia.org/wiki/Centrex