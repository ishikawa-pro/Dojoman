module GameOver	
	class GameOver
		include SceneUtil
		WINDOW_WIDTH = 800
		def initialize
			@bg_img = Image.load("images/bg/gameover.png")
			@bg_img.set_color_key([255, 255, 255])
			
		end

		def play
			Window.draw(0, 0, @bg_img)
		end
	end
end