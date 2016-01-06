class Dog

	attr_accessor :name, :breed
	def initialize(name, breed)
		@name = name
		@breed = breed
	end
	
	def bark
		puts "Woof!"
	end
	
	def show_methods
	Dog.instance_methods(false).each do |method|
		puts method.to_s
		end
	end
	
	def to_s
		"(#{name}, #{breed})"
	end
end

class Input_framework
	
	attr_accessor :object
	def initialize(object)
		@object = object
	end
	
	def show_variables
		@object.instance_variables.each do |var|
			puts var
		end
	end
	
	def get_info
		puts "Enter information for your #{@object.class}"
		@object.instance_variables.each do |var|
			puts "Enter the #{var[1..var.length-1]}:"
			@object.instance_variable_set(var, gets.chomp)
		end
	end
	
	def print_info
		@object.instance_variables.each do |var|
			puts "#{var}"
		end
	end
	
end

doggy = Dog.new("test", "test")
test = Input_framework.new(doggy)
test.show_variables
test.get_info
puts doggy