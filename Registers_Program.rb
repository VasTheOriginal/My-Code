require_relative './input_functions'

@finished = false 

def scan_items 
	counter = read_integer('
	How many items does the customer have?')
	index = 0
	@items = Array.new()
	while index < counter
		item = read_float('Enter Amount (in $$$)')
		@items << item
		index += 1
	end
	@items
end

def print_items	scan_items
	i = 0
	counter = @items.length.to_i
	while i < counter
		puts 'Item ' + (i + 1).to_s + '                           ' + @items[i].to_s + ' $'
		i += 1
	end
end

def find_total
	@result = 0
	@items.each do |i|
    if i!= 0
        @result = @result + i
    else
        @result
    end
	end
	puts 'The Total is                      ' + @result.round(2).to_s + ' $' 
	
	puts 'Is there any discount on the total price? (Y,y,N,n)'
	discounts
end


def discounts
	case gets.chomp
		when 'Yes', 'yes', 'y', 'Y'
			puts 'Enter discount in %'
			discount = gets.to_f
			@result = @result - (@result * discount / 100)
			puts 'Final Price is ' + @result.to_s + '$'
			puts 'Cash or Eftpos? (C,c,E,e)'
		case gets.chomp
		when 'Cash', 'cash', 'c', 'C'
			payment_cash
		when 'Eftpos', 'eftpos', 'e', 'E'
			payment_card
		end
		when 'no','No','n','N'
		puts 'Cash or Eftpos?'
		case gets.chomp
		when 'Cash', 'cash', 'c', 'C'
			payment_cash
		when 'Eftpos', 'eftpos', 'e', 'E'
			payment_card
		end
	end
end

	
def payment_cash
	cash_amount = read_float('How much cash does the customer want to pay with?')
	if cash_amount == @result.to_f
		puts 'The Amount is fully paid!'
		puts '
	
	
	
	Thanks for shopping with H&M, Have a wonderfull day!'
	
	elsif cash_amount < @result.to_f
		difference = @result.to_f - cash_amount.to_f
		puts 'There is still ' + difference.round(2).to_s + '$' + ' to pay!'
		@result = difference.to_f
		payment_cash
	elsif cash_amount > @result.to_f
		change = cash_amount.to_f - @result.to_f
		read_string ('Till is opening ........................')
		puts 'Give the customer ' + change.round(2).to_s + '$' + ' change. Have a Great Day and thanks for shopping at H&M!'
	end
end

def payment_card
	var1 = read_float('How much $$$ on card?')
	read_string ('Card Payment pending..................')
	if var1 == @result
		puts 'Payment has been successful! Have a great day and thank you for shopping at H&M!'
	elsif var1 < @result
		puts 'Payment has been unsuccessful!!! Please Revise your payment method!'
		payment_cash
	elsif var1 > @result
		puts 'Payment has been successful! Have a great day and thank you for shopping at H&M!'
	end
end

def login_system
	username = 4432
	password = 3156
	user = read_integer('Enter Username')
	pass = read_integer('Enter Password')
	if user == username and pass == password
		puts 'Welcome Back Vasilios!'
	else 
		puts 'Unknown Employee, Try again!'
		login_system
	end
end

def main
	print_items (scan_items)
	find_total
end

login_system

while @finished == false
	main
end




