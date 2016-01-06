require 'minitest/autorun'
require_relative 'bsearch.rb'

class KataBSearchTest < Minitest::Test

	def test_chop
	  bs = KataBSearch.new  # modify to match your class!
	  assert_equal(-1, bs.chop(3, []))
	  assert_equal(-1, bs.chop(3, [1]))
	  assert_equal(0, bs.chop(1, [1]))
	  #
	  assert_equal(0, bs.chop(1, [1, 3, 5]))
	  assert_equal(1, bs.chop(3, [1, 3, 5]))
	  assert_equal(2, bs.chop(5, [1, 3, 5]))
	  assert_equal(-1,bs.chop(0, [1, 3, 5]))
	  assert_equal(-1,bs.chop(2, [1, 3, 5]))
	  assert_equal(-1,bs.chop(4, [1, 3, 5]))
	  assert_equal(-1,bs.chop(6, [1, 3, 5]))
	  #
	  assert_equal(0, bs.chop(1, [1, 3, 5, 7]))
	  assert_equal(1, bs.chop(3, [1, 3, 5, 7]))
	  assert_equal(2, bs.chop(5, [1, 3, 5, 7]))
	  assert_equal(3, bs.chop(7, [1, 3, 5, 7]))
	  assert_equal(-1, bs.chop(0, [1, 3, 5, 7]))
	  assert_equal(-1, bs.chop(2, [1, 3, 5, 7]))
	  assert_equal(-1, bs.chop(4, [1, 3, 5, 7]))
	  assert_equal(-1, bs.chop(6, [1, 3, 5, 7]))
	  assert_equal(-1, bs.chop(8, [1, 3, 5, 7]))
	end
end