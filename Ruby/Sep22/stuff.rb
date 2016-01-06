module EasyAccess
	private 

	def readonly(*syms)
	     # do nothing if no args
	    return if syms.size == 0
	    # code starts as empty string
	    code = "" 

	    # generate Ruby code to define 	
	    # attr reader methods
	    # Notice how the symbol is       
	    # interpolated into the code
		
	   syms.each do |s|
	         code << "def #{s}; @#{s}; end\n"
	   end
		
	   # use class_eval to create instance 
	   # methods
	   class_eval code
	end
	
# this method is like attr_accessor
	def readwrite(*syms)
	    return if syms.size == 0
	    code = ""
	    syms.each do |s|
	        code << "def #{s}; @#{s}; end\n"
	       code << "def #{s}=(value); @#{s} = 
		value; end\n"
	    end
		
   	    class_eval code
	
	end
	
end
