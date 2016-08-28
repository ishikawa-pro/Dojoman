module Title	
	class Director
		include SceneUtil
		WINDOW_WIDTH = 800
		def initialize
			@bg_img = Image.load("images/bg/title.png")
		end

		def play
			Window.draw(0, 0, @bg_img)
		end
	end
end