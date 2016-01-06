#Our program uses reflection for our Computer_player class by using Input_framwork
#The show_variables function in Input_framwork will display a list of the possible computer opponents to select from
#The get_info function takes the input from the user and sets the corresponding computer difficulty to true

class Input_framework
	
	attr_accessor :object
	def initialize(object)
		@object = object
	end
	
	def show_variables
	i = 1
		@object.instance_variables.each do |var|
			puts "#{i}: #{var[1..var.length-1]}"
			i = i + 1
		end
	end
	
	def get_info
	
	selection = 0
	#Make sure the input for computer player is a valid number
	while (selection > @object.instance_variables.length or selection < 1)
		puts "Select computer player (1-#{@object.instance_variables.length}):"	
		selection = gets.to_i
	end
	
	@object.instance_variables[selection-1] = "true"
	puts @object.instance_variables[selection-1]
	
	#Go through our array and set the computer selected equal to true
	i = 0
	@object.instance_variables.each do |var|
		if (i == selection - 1)
		@object.instance_variable_set(var, true)	
		end
		i = i + 1
	end
	end
	
end

class Computer_player
	
	attr_accessor :smart_computer_player, :dumb_computer_player
	
	def initialize()
		@smart_computer_player = smart_computer_player
		@dumb_computer_player = dumb_computer_player
	end
	
	def make_move(board)
		
		
		if (smart_computer_player)
		
			#Base case: check to see if only 1 row has more than one stick remaining
			empty = 0
			onlyone = 0
			goldenrow = 0
			i = 0
			board.each do |row|
				i = i + 1
				if (row == 0)
					empty = empty + 1
				elsif (row == 1)
					onlyone = onlyone + 1
				else
					goldenrow = i
				end
			end
			
			#If this is true, then we want to take sticks from the only row with <1 sticks remaining
			#We take either all of the sticks or all but 1, depending on the # of remaining rows
			if (board.length - empty - onlyone <= 1)
				puts "Found only winning move:"
				puts board.length
				puts empty
				puts onlyone
				if (onlyone % 2 == 1 && (board.length - empty - onlyone == 1))
					#Take all sticks
					puts "row: #{goldenrow} sticks: #{board[goldenrow - 1]}"
					return goldenrow, board[goldenrow - 1]
				elsif (onlyone % 2 == 0 && (board.length - empty - onlyone == 1))
					#Take all but 1 stick
					puts "row: #{goldenrow} sticks: #{board[goldenrow - 1] - 1}"
					return goldenrow, board[goldenrow - 1] - 1
				else
					for i in 0..(board.length-1)
						if (board[i] != 0)
							puts "#{i+1}, 1 stick"
							return (i+1), 1
						end
					end
				end
			end
			
			
			#Otherwise, we run iteratively through the rows to find a future-proof winning move
			currentrow = 1
			board.each do |row|
				sticks = 1
				
				#For each row, try removing 1, 2, 3, etc sticks until we find a winning move
				while (sticks <= row)
				
				#create a copy of the board
				board2 = board.dup
				

				
				
				#Try to take some sticks from the current row
				board2[currentrow-1] = board2[currentrow-1] - sticks
				
				#
				winning = "0"
				board2.each do |row2|
					winning = (winning.to_i(2) ^ row2).to_s(2)
				end
				
				#This is the condition for a winning move, so find the take the first one we can find and return it
				if (winning == "0")
					puts "Smart computer took #{sticks} sticks from row #{currentrow}"
					return currentrow, sticks
				end
	
				sticks = sticks + 1
				
				end
				
				#update our row counter
				currentrow = currentrow + 1
			end
			
			
		else
		
		end
		
	end
	
end

if __FILE__ == $0
comp = Computer_player.new
test = Input_framework.new(comp)
test.show_variables
test.get_info

board = [1, 1, 3]
comp.make_move(board)
end