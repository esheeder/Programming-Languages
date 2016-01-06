require_relative "RegExpProcessor.rb"

#Class used to store the information for each message. In our hash, the key is the uniqueID, and the value is a Message object
class Message
	attr_accessor :uniqueID, :otherID, :date, :time, :to, :from, :size
	def initialize(uniqueID, otherID, date, time, to, from, size)
		@uniqueID = uniqueID
		@otherID = otherID
		@date = date
		@time = time
		@to = to
		@from = from
		@size = size
	end
	
	def to_s
		puts "Unique ID: #{uniqueID}"
		puts "Message ID: #{otherID}"
		puts "Sent: #{date}at #{time}"
		puts "From: #{from}"
		puts "To: #{to}"
		puts "Size: #{size}"
	end
	
end

#create a hash so we can keep track of our unique messages
messages = Hash.new

#open the file
wordfile = File.open("mail.log", "r")
	
#read each line
wordfile.each_line do |line|
		
	#For every line, we should first find the unique ID to see if we have seen it before
	uniqueid = RegExpProcessor.find_unique_id(line)
	
	#If we haven't seen it before, we should create a new message with the known time/date and add it to the hash
	if (!messages.has_key?(uniqueid))
		date = RegExpProcessor.find_date(line)
		time = RegExpProcessor.find_time(line)
		#puts "Adding #{uniqueid} sent on #{date} at #{time} to hash"
		tempmessage = Message.new(uniqueid, 1, date, time, [], 1, 1)
		messages[uniqueid] = tempmessage
	end
	
	#Now we should try to find any other data on the line and update our hash accordingly
	
	#Look for the email sender
	from = RegExpProcessor.find_from(line)
	if (from != nil)
		messages[uniqueid].from = from
	end
	
	#look for email size
	size = RegExpProcessor.find_size(line)
	if (size != nil)
		messages[uniqueid].size = size
	end

	#Look for the email recipient
	to = RegExpProcessor.find_to(line)
	if (to != nil)
		messages[uniqueid].to.push(to)
	end
	
	#Look for email id
	id = RegExpProcessor.find_id(line)
	if (id != nil)
		messages[uniqueid].otherID = id
	end
end
wordfile.close

#Print out all of our messages
messages.each do |key, value|
	puts value.to_s
end

puts "Total messages: #{messages.size}"