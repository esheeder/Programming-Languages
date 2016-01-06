require 'test/unit'
require_relative 'words.rb'

class WordTests < Test::Unit::TestCase
	
	def testwords
	testwords = Words.new("testWords.txt")
	
	#test to make sure our word file is valid and has at least 1 entry
	puts testwords.wordlist.count
	assert_not_nil(testwords.wordlist.length)
	
	#test for selecting random word. runs 200 times, making sure each word was selected at least once.
	word1 = 0
	word2 = 0
	word3 = 0
	word4 = 0
	for i in 0..200
		if(testwords.pick_word == "banana")
			word1 += 1;
		end
		if(testwords.pick_word == "kiwi")
			word2 += 1;
		end
		if(testwords.pick_word == "grapefruit")
			word3 += 1;
		end
		if(testwords.pick_word == "apple")
			word4 += 1;
		end
	end
	assert_not_equal(0, word1)
	assert_not_equal(0, word2)
	assert_not_equal(0, word3)
	assert_not_equal(0, word4)
	end
end