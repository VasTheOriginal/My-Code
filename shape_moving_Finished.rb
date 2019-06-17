require 'gosu'

module ZOrder
  BACKGROUND, MIDDLE, TOP = *0..2
end
SCREEN_SIZE = 500
SHAPE_DIM = 50

# Instructions:
# Fix the following code so that:
# 1. The shape also can be moved up and down
# 2. the shape does not move out of the window area

class GameWindow < Gosu::Window

  # initialize creates a window with a width an a height
  # and a caption. It also sets up any variables to be used.
  # This is procedure i.e the return value is 'undefined'
  def initialize
    super SCREEN_SIZE, SCREEN_SIZE, false
    self.caption = "Shape Moving"
    @shape_y = SCREEN_SIZE / 2
    @shape_x = SCREEN_SIZE / 2
   end
	
  # Put any work you want done in update
  # This is a procedure i.e the return value is 'undefined'
  def update

    if button_down?(Gosu::KbRight)
		if @shape_x != (SCREEN_SIZE - SHAPE_DIM) 
        @shape_x += 6
		if @shape_x > (SCREEN_SIZE - SHAPE_DIM)
		@shape_x = 0
   end
   end	   
end	 
	if button_down?(Gosu::KbLeft) && (@shape_x != 0)
    if @shape_x != (SCREEN_SIZE - SHAPE_DIM)
		@shape_x -= 6
	if @shape_x < -width + 450
		@shape_x = SCREEN_SIZE
	end
end	
end

	if button_down?(Gosu::KbUp)
		if @shape_y != (SCREEN_SIZE - SHAPE_DIM) 
		@shape_y -= 6
		if @shape_y < -height + 450
		@shape_y = SCREEN_SIZE
		end
	end
end

	if button_down?(Gosu::KbDown)
		if @shape_y != (SCREEN_SIZE - SHAPE_DIM) 
		@shape_y += 6
		if @shape_y >= (SCREEN_SIZE - SHAPE_DIM)
		@shape_y = 0
   end
	end
  end
end  
     # Draw (or Redraw) the window
  # This is procedure i.e the return value is 'undefined'
  def draw
    Gosu.draw_rect(@shape_x, @shape_y, SHAPE_DIM, SHAPE_DIM, Gosu::Color::RED, ZOrder::TOP, mode=:default)
  end
end 	
window = GameWindow.new
window.show	    
    




	
	
	
	