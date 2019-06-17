puts 'This is the random number generator, Do you want to play?   [yes,no]'
   
    case gets.strip
	    
		when 'Y','y','Yes','yes'
		puts 'Great, Lets choose the highest possible random number. What do you want it to be?'
		number = gets.to_i
		puts  'Your random number is ' + ( rand(number)).to_s
		
		when 'N','n','No','no'
		
		puts 'No problems, see you next time!'
		
		
		
		end	
		
		
		
		
    
	