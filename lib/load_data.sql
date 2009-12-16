### Country Code
SELECT concat("'", code, "' => {:national_destination_codes => 2, :abbreviation => '",abbreviation,"', :description => '", name,"', :info => 'en.wikipedia.com.org",url,"'},") FROM `e164` WHERE parent_id is null ORDER BY length(code),code

### NANP
SELECT concat("'", code, "' => {:abbreviation => '",abbreviation,"', :description => '", name,"', :info => 'en.wikipedia.com.org",url,"'},") FROM `e164` WHERE parent_id = 1 ORDER BY length(code),code