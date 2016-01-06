require 'test/unit'
require_relative 'nim.rb'
#load "./nim.rb"

class NimTests < Test::Unit::TestCase
	
	#testing a single row of matches - should always select all matches but 1
	def testonerow	
	comp = Computer_player.new
	comp.smart_computer_player = true
	
	#take 4 sticks from row 1
	assert_equal([1, 4], comp.make_move([5]))
	
	assert_equal([1, 7], comp.make_move([8]))
	assert_equal([1, 1], comp.make_move([2]))
	
	end
	
	#tests where we have all rows of 0 except for 1
	def testonenoneemptyrow
	comp = Computer_player.new
	comp.smart_computer_player = true
	assert_equal([2, 4], comp.make_move([0, 5]))
	assert_equal([1, 4], comp.make_move([5, 0]))
	assert_equal([3, 7], comp.make_move([0, 0, 8]))
	
	end
	
	#tests where we have all rows of 1 except for 1
	def testrowswithone
	comp = Computer_player.new
	comp.smart_computer_player = true
	assert_equal([2, 5], comp.make_move([1, 5]))
	assert_equal([1, 5], comp.make_move([5, 1]))
	assert_equal([3, 7], comp.make_move([1, 1, 8]))
	end
	
	#tests games with multiple rows with multiple sticks
	#for these tests, there may be multiple possible winning moves
	#however, our AI will always take the winning move from the lowest-index with the fewest sticks
	
	def testgames
	
	comp = Computer_player.new
	comp.smart_computer_player = true
	
	assert_equal([1,1], comp.make_move([1, 3, 4, 7]))
	assert_equal([3,5], comp.make_move([1, 3, 5, 2]))
	assert_equal([1,1], comp.make_move([1, 3, 1, 2]))
	
	
	end
	
end