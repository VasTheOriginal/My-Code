require_relative './input_functions'

@finished = false

# Takes in an Integer and stores the remainders in an array.

def hexadecimal_conversion
	decimal = read_integer ('What is the value you would like to convert to Hexadecimal?')
	@final_result = Array.new()
	while decimal > 0
		item = decimal % 16
		decimal = decimal / 16
		@final_result << item
	end
	@final_result
end

# Prints the stored values with their corresponding values backwards. 

def print_result
	i = @final_result.length
	counter = 0
	print 'Ox '
	while i >= counter
		if @final_result[i].to_i == 15
			print 'F'
			i -= 1
		elsif @final_result[i].to_i == 14
			print 'E'
			i -= 1	
		elsif @final_result[i].to_i == 13
			print 'D'
			i -= 1	
		elsif @final_result[i].to_i == 12
			print 'C'
			i -= 1	
		elsif @final_result[i].to_i == 11
			print 'B'
			i -= 1	
		elsif @final_result[i].to_i == 10
			print 'A'
			i -= 1		
		else 
			print @final_result[i].to_s
		i -= 1
		end
	end
	puts ''
end

# Calls Main. 

def main
	hexadecimal_conversion
	print_result
end

# Keeps the program running indefinantly.

until @finished == true
	main
end

	
	