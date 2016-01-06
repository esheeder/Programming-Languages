module RegExpProcessor

	def is_float(number)
	return number =~ /\d*[.]\d+/
	end

	def is_date(date)
		return date =~ /^(0?[0-9]|1[0-2])[-|\/](0?[0-9]|[12][0-9]|3[0-1])[-|\/]([1-2]\d{3}|\d{2})$/
	end
	
	def is_complex(number)
		return number =~ /[-+]?\d+[-+]?\d*[i]/
	end
	
end