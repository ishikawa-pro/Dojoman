
module Preparation1	
	class Director
		include SceneUtil
		WINDOW_WIDTH = 800
		def initialize
			@bg_img = Image.load("images/bg/izumo1.png")
			set_timer(2)
		end

		def play
			Window.draw(0, 0, @bg_img)
			count_down(:scene1)
		end
	end
end