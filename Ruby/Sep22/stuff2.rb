require_relative 'stuff'
include EasyAccess

class Dog
		
	readonly :numLegs, :numEyes, :numSpots
	readwrite :name
	def initialize(numLegs, numEyes, numSpots, name)
		@numLegs = numLegs
		@numEyes = numEyes
	@numSpots = numSpots
		@name = name
	end
	
end
	
doggy = Dog.new(4, 1, 3, 'Spot')
puts doggy.name
doggy.name = 'Spot2'
puts doggy.name