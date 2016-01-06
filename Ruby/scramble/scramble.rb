require_relative 'words.rb'

class Words
	
	#overloaded bracket operator
	def [](i)
		return @wordlist[i]
	end
	
end

#function for scrambling a word
def scramble(word)
	for i in 0..100
		one = rand(word.length-1)
		two = rand(word.length-1)
		word[one], word[two] = word[two], word[one]
	end
end

#Create a new words object
scramble = Words.new("testWords.txt")

#run through each loaded word and play the game
for i in 0..scramble.wordlist.length-1
	
	answer = scramble[i]
	word = answer.dup
	scramble(word)

	puts "Scrambled word: #{word}"
	puts "\nWhat's the word?"
	useranswer = gets
	useranswer = useranswer.strip #clean up whitespace from user input
	
	#compare values
	if (answer.downcase == useranswer.downcase)
		puts "That is correct!"
	else
		puts "Sorry, that's not correct."
	end
	
	#see if we ran out of words
	if (i == scramble.wordlist.length-1)
		puts "That's all the words, thanks for playing!"
		abort
	end
	
	#if still more words, ask if they want to continue playing
	puts "\nContinue? (y/n)"
	cont = gets
	cont = cont.strip
	if (cont.downcase == 'n')
	puts "Smell you later"
		abort
	end
end