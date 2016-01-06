gem "minitest"
require 'minitest/autorun'
# for prior versions of Ruby (e.g., 1.9.3), use test/unit
#require 'test/unit'
require_relative "RegExpProcessor.rb"
include RegExpProcessor

# when using test/unit, we extend TestCase
class RegExpProcessorTester < Minitest::Test

# Returns the 11 character unique ID on the line
  def test_find_unique_id
    assert_equal("A54F11B2003", RegExpProcessor.find_unique_id("Dec 11 05:14:03 toilers postfix/pickup[3635]: A54F11B2003: uid=33 from=<toilers@mines.edu>")) 
	assert_equal("B52A91B2004", RegExpProcessor.find_unique_id("Dec 11 05:14:03 toilers postfix/qmgr[1387]: B52A91B2004: removed")) 
	assert_equal(nil, RegExpProcessor.find_unique_id("Dec 11 08:43:24 toilers postfix/pickup[6979]: XX: uid=0 from=<root>"))  
  end
 
 #Returns the date on the line
  def test_find_date
    assert_equal("Dec 11", RegExpProcessor.find_date("Dec 11 05:14:03 toilers postfix/pickup[3635]: A54F11B2003: uid=33 from=<toilers@mines.edu>")) 
	assert_equal("Dec 12", RegExpProcessor.find_date("Dec 12 11:32:57 toilers postfix/qmgr[1387]: 2C1981BA094: removed")) 
	assert_equal(nil, RegExpProcessor.find_date("December 11 08:43:24 toilers postfix/pickup[6979]: XX: uid=0 from=<root>"))  
  end
  
  #Returns the time
  def test_find_time
    assert_equal("05:14:03", RegExpProcessor.find_time("Dec 11 05:14:03 toilers postfix/pickup[3635]: A54F11B2003: uid=33 from=<toilers@mines.edu>")) 
	assert_equal("11:32:57", RegExpProcessor.find_time("Dec 12 11:32:57 toilers postfix/qmgr[1387]: 2C1981BA094: removed")) 
	assert_equal(nil, RegExpProcessor.find_time("Dec hh:mm:ss toilers postfix/pickup[6979]: XX: uid=0 from=<root>"))  
  end
  
  #Returns the from-address
  def test_find_from
    assert_equal("<toilers@mines.edu>", RegExpProcessor.find_from("Dec 11 05:14:03 toilers postfix/pickup[3635]: A54F11B2003: uid=33 from=<toilers@mines.edu>")) 
	assert_equal(nil, RegExpProcessor.find_from("Dec 12 11:32:57 toilers postfix/qmgr[1387]: 2C1981BA094: removed")) 
	assert_equal(nil, RegExpProcessor.find_from("Dec 12 11:25:29 toilers postfix/pickup[20833]: E84B11BA094: uid=33 from=<www-data>")) 	
  end
  
  #Returns the from-address
  def test_find_to
    assert_equal("<mickeymouse@mymail.mines.edu>", RegExpProcessor.find_to("Dec 12 11:25:30 toilers postfix/smtp[20951]: E84B11BA094: to=<mickeymouse@mymail.mines.edu>, relay=smtp.Mines.EDU[138.67.1.48]:25, delay=0.15, delays=0.06/0.01/0.04/0.04, dsn=2.0.0, status=sent (250 2.0.0 rBCIPUwv027569 Message accepted for delivery)")) 
	assert_equal(nil, RegExpProcessor.find_to("Dec 11 05:14:03 toilers postfix/pickup[3635]: A54F11B2003: uid=33 from=<toilers@mines.edu>")) 
	assert_equal(nil, RegExpProcessor.find_to("Dec 12 11:25:29 toilers postfix/pickup[20833]: E84B11BA094: uid=33 from=<www-data>")) 	
  end
  
  #Returns the size
  def test_find_size
    assert_equal(nil, RegExpProcessor.find_size("Dec 12 11:25:30 toilers postfix/smtp[20951]: E84B11BA094: to=<mickeymouse@mymail.mines.edu>, relay=smtp.Mines.EDU[138.67.1.48]:25, delay=0.15, delays=0.06/0.01/0.04/0.04, dsn=2.0.0, status=sent (250 2.0.0 rBCIPUwv027569 Message accepted for delivery)")) 
	assert_equal("2113", RegExpProcessor.find_size("Dec 12 09:45:48 toilers postfix/qmgr[1387]: 5FEAA1BA094: from=<www-data@toilers.Mines.EDU>, size=2113, nrcpt=1 (queue active)")) 
	assert_equal("3795", RegExpProcessor.find_size("Dec 12 11:25:29 toilers postfix/qmgr[1387]: E84B11BA094: from=<www-data@toilers.Mines.EDU>, size=3795, nrcpt=1 (queue active)")) 	
  end
  
  #My main file uses a hash table to store unique log IDs, so the total number of messages is just the size of the hash table once it's done reading the file
  #Because of this, there is no easy way to run unit tests on the number of messages, so I don't have any
  
end