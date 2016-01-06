class KataBSearch 
  def chop(target, array)
  if (array.length == 0)
	return -1
  end
  
  #low and high will keep track of our upper and lower indices that we are looking between
  low = 0
  high = array.length - 1
  mid = 0
  
  while (high >= low)

	#Base case, 1 value
	if (high == low)
		if (array[high] == target)
			return high
		else
			return -1
		end
	end

	#Case for odd number of values remaining to check
	if ((high - low + 1) % 2 == 1)
		mid = (high + low)/2
	#Case for even number
	else
		mid = (high + low + 1)/2
	end
	
	#Check the middle value, return this position if it matches
	if (array[mid] == target)
		return mid
	#if value is too high
	elsif array[mid] > target
		high = mid - 1
	#if value is too low
	elsif array[mid] < target
		low = mid + 1
	end
  end
  #if we didn't find it, return -1
  return -1
  end
end