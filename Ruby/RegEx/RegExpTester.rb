gem "minitest"
require 'minitest/autorun'
# for prior versions of Ruby (e.g., 1.9.3), use test/unit
#require 'test/unit'
require_relative "RegExpProcessor.rb"
include RegExpProcessor

# when using test/unit, we extend TestCase
class RegExpProcessorTester < Minitest::Test

# Tests floating point values. Must have a decimal point. May omit
# digits before the decimal (but digits after the decimal are required).
  def test_float
    assert_equal(0, RegExpProcessor.is_float("12.4"))  
    assert_equal(0, RegExpProcessor.is_float("0.4"))
    assert_equal(7, RegExpProcessor.is_float("value: 123.45"))
    assert_equal(0, RegExpProcessor.is_float(".4"))    
    assert_equal(nil, RegExpProcessor.is_float("123"))
    assert_equal(nil, RegExpProcessor.is_float("123."))
    assert_equal(nil, RegExpProcessor.is_float("abc"))
	puts RegExpProcessor.is_float("value: 123.45")
  end
  
# Tests dates. We will accept dates with - or / between segments.
# Month and day may have one or two digits. Year must be either
# 2 or 4 digits. If 4 digits, should start with 1 or 2. 
# For simplicity, we don't consider leap year
  
  def test_date
    # test with 1 and 2 digits for month/day, 2 digit year
    assert_equal(0, RegExpProcessor.is_date("01-01-14"))
    assert_equal(0, RegExpProcessor.is_date("1-01-14"))
    assert_equal(0, RegExpProcessor.is_date("1-1-14"))
    # test with 1 and 2 digits for month/day, 4 digit year
    assert_equal(0, RegExpProcessor.is_date("01-01-2014"))
    assert_equal(0, RegExpProcessor.is_date("1-01-2014"))
    assert_equal(0, RegExpProcessor.is_date("1-1-2014"))
    # test with too many digits for month/day, 2 digit year
    assert_equal(nil, RegExpProcessor.is_date("1-123-2014"))
    assert_equal(nil, RegExpProcessor.is_date("123-12-2014"))
    # test with day > 31
    assert_equal(nil, RegExpProcessor.is_date("1-32-14"))
    # test with month > 12
    assert_equal(nil, RegExpProcessor.is_date("13-10-14"))
    assert_equal(nil, RegExpProcessor.is_date("21-10-14"))
    # test day boundary
    assert_equal(0, RegExpProcessor.is_date("1-31-14"))
    # test month boundary
    assert_equal(0, RegExpProcessor.is_date("12-31-2014"))
    # test invalid year
    assert_equal(nil, RegExpProcessor.is_date("1-10-0145"))
    assert_equal(nil, RegExpProcessor.is_date("1-10-3145"))
    assert_equal(nil, RegExpProcessor.is_date("1-10-20145"))
    # test a few with /
     assert_equal(0, RegExpProcessor.is_date("1/31/14"))
    assert_equal(0, RegExpProcessor.is_date("12/31/2014"))
    assert_equal(0, RegExpProcessor.is_date("01/01/14"))
    assert_equal(nil, RegExpProcessor.is_date("13/10/14"))
    assert_equal(nil, RegExpProcessor.is_date("1/32/14"))   
  end

# Test for complex numbers, including for example -3+4i, +5-6i, +7i, 8i, -12i
  def test_complex
    # simple i, 1 or more digits
    assert_equal(0, RegExpProcessor.is_complex("4i"))
    assert_equal(0, RegExpProcessor.is_complex("43i"))
    # simple i, 1 or more digits with sign  
    assert_equal(0, RegExpProcessor.is_complex("-46i"))
    assert_equal(0, RegExpProcessor.is_complex("+46i"))
    # simple real +/- imaginary
    assert_equal(0, RegExpProcessor.is_complex("35+46i"))
    assert_equal(0, RegExpProcessor.is_complex("3-46i"))
    # signed real and signed imaginary
    assert_equal(0, RegExpProcessor.is_complex("-35+46i"))
    assert_equal(0, RegExpProcessor.is_complex("+3-46i"))
    # a couple non-complex
    assert_equal(nil, RegExpProcessor.is_complex("abc"))
    assert_equal(nil, RegExpProcessor.is_complex("65"))    
  end
end