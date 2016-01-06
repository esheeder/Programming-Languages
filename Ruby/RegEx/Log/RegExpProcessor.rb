module RegExpProcessor
	
	module_function
	
	#returns the 11-character unique id on the line so we know which message we are working with
	def find_unique_id(line)
		temp = line =~ /\w{11}:/
		if (temp != nil)
			temp = line[temp..temp+10]
		end
		return temp
	end
	
	#returns the date of the line
	def find_date(line)
		temp = line =~ /^[a-zA-z]{3} \d{2}/
		if (temp != nil)
			temp = line[temp..temp+5]
		end
		return temp
	end
	
	#returns the time of the line
	def find_time(line)
		temp = line =~ /\d{2}:\d{2}:\d{2}/
		if (temp != nil)
			temp = line[temp..temp+7]
		end
		return temp
	end
	
	#returns the from-address from the line
	def find_from(line)
		temp = line[/from=<\S*@\S*>/]
		if (temp != nil)
			temp = temp[/<\S*>/]
		end
		return temp
	end
	
	#returns the size of the message from the line
	def find_size(line)
		temp = line[/size=\d*/]
		if (temp != nil)
			temp = temp[/\d+/]
		end
		return temp
	end
	
	#returns the to-address from the line
	def find_to(line)
		temp = line[/to=<\S*@\S*>/]
		if (temp != nil)
			temp = temp[/<\S*>/]
		end
		return temp
	end
	
	#return the message id from the line
	def find_id(line)
		temp = line[/message-id=<\S*@\S*>/]
		if (temp != nil)
			temp = temp[/<\S*>/]
		end
		return temp
	end
	
end