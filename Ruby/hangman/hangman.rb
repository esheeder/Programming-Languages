require_relative 'words.rb'

class Hangman

	@words #words oject for storing the words
	@remainingguesses #keeps track of number of wrong guesses
	@lettersguessed #array containing the letters already guessed
	@currentword #the mystery word
	
	#sets up the game, loads the words
	def initialize(file)
		@words = Words.new(file)
	end
	  
	#resets everything and selects a new word to start a new game
	def new_game()
		@remainingguesses = 6
		@lettersguessed = []
		@currentword = @words.pick_word
		play_game
	end
	  
	#plays the game by allowing guesses until either the word is correct or all guesses are used
	#also prints out the spaces and letters to the console
	def play_game()
		
		#logic for playing the game until a win condition is met or the user enters a word
		while (@remainingguesses > 0)
		
			display_word
		
			#Asking for an input
			print "\nEnter your next letter or '0' to guess the answer:"
			guess = guess_letter
		
			#Check to see if the input is a 0, in which case the user wins or loses now
			if (guess == '0')
				guess_word
				ask_new_game
			end
			
			#Otherwise, make sure the letter hasn't been guessed before
			while (@lettersguessed.include? guess)
				puts "\nYou've already guessed that letter. Please try again"
				guess = guess_letter
			end
			@lettersguessed.push(guess)
			
			#Check to see if the guess is correct or not
			if (!@currentword.include? guess)
				@remainingguesses -= 1
			end
			
			#Check if the game is over due to win, if so, exit loop
			won = true
			for i in 0..@currentword.length - 1
				if (!@lettersguessed.include? @currentword[i])
					won = false
				end
			end
			#If we won, break out of loop
			if (won == true)
				break
			end
		end
		
		#Display message for winning or losing, then ask to play again
		if (@remainingguesses == 0)
			puts "Sorry, too many bad guesses!"
		else
			puts "Congratulations, you win!"
		end
		ask_new_game
	end
	
	#this function prints the word, wrong guesses, and remaining guesses
	def display_word
	
		#Displaying the word
		puts "THE WORD"
		for i in 0..@currentword.length - 1
			if (@lettersguessed.include? @currentword[i])
				print "#{@currentword[i]} "
			else
			print "_ "
			end
		end
		puts

		#Printing out UI Stuff
		print "\nBad guesses (#{@remainingguesses} left): "
		@lettersguessed.each do |x|
			if (!@currentword.include? x)
				print "#{x}"
			end
		end	
	end
	
	#Prompts the user to put in a letter, returns the lowercase equivalent of the first character entered
	def guess_letter()
		letter = gets
		letter = letter[0]
		return letter.downcase
	end
	
	#Allows the user to guess an entire word and either win or lose the game on the spot
	def guess_word
		puts "What's the word?"
		answer = gets
		answer = answer.strip
		if (answer.downcase == @currentword.downcase)
			puts "\nThat's correct, you win!"
		else
			puts "\nThat's not correct, you lose!"
		end
	end
	
	#Asks the user if they want to play again and responds accordingly
	def ask_new_game
		puts "\nEnter 'q' to quit or any other character for another game:"
		answer = gets
		answer = answer.strip
		if (answer.downcase != 'q')
			new_game
		else
			abort
		end
	end
	
end

#Check to use a given text file or just revert to default
temp = "testWords.txt"
if (ARGV.length == 1)
	temp = ARGV[0]
end
ARGV.clear
hangman = Hangman.new(temp)
hangman.new_game