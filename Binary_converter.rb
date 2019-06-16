require_relative './input_functions'

@finished = false

# Takes in an Integer and calculates the correct binary representation.

def binary_conversion
	decimal = read_integer('What is the Decimal value you would like to convert to Binary?')
	@final_result = Array.new()
	while decimal > 0
		item = decimal % 2
		decimal = decimal / 2
		@final_result << item
	end
	@final_result
end

# Takes in the array of results and represents it backwards.

def print_result
	i = @final_result.length
	counter = 0
	print 'Ob '
	while i >= counter
		print @final_result[i]
		i -= 1
	end
	puts ''
end

# Executes the program.

def main
	binary_conversion
	print_result
end

# Keeps the program running indefinantly.

until @finished == true
	main
end





