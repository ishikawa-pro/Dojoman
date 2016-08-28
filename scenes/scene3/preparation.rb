module Preparation3
	class Director
		include SceneUtil
		WINDOW_WIDTH = 800
		def initialize
			@bg_img = Image.load("images/bg/aquas1.png")
			set_timer(2)
		end

		def play
			Window.draw(0, 0, @bg_img)
			count_down(:scene3)
		end
	end
end