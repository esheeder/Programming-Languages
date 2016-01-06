class Words

	@wordlist
	
	#opens the file and puts all of the words into an array
	def initialize(file)
	
		@wordlist = []
		
		#open the file
		wordfile = File.open(file, "r")
		
		#read each line
		wordfile.each_line do |line|
		
			#this line splits up the line by spaces, and puts each word into an array
			words = line.split(/\W+/)
			
			#put each word into our wordlist array
			words.each do |theword|
				@wordlist.push(theword)
			end
		
		end
		wordfile.close
	end
	
	#picks a random word from the array containing the words
	def pick_word
		return @wordlist.at(rand(@wordlist.length))
	end
	
	#getter for testing
	def wordlist
		@wordlist
	end
	
end

#testwords = Words.new("testWords.txt")
#testwords.pick_word

#this was used to figure out how to break up multiple words on one line
#http://stackoverflow.com/questions/7622369/ruby-extracting-words-from-string