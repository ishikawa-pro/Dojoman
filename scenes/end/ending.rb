require 'dxruby'

module Ending
	class Ending
	  attr_accessor :score
	  #attr_accessor :image
	  
	 def initialize(price = 300, dojoman = 0, x = 130, y = 80, i = 0)
	  @price = 100
	  @dojoman = 0
	  @score = 0
	  @x = 130
	  @y = 80
	  @i = 0
	  @font = Font.new(64)
	  @dojoman_image = [Image.load('images/dojoman/isshy_dojoman.png'),
	                    Image.load('images/dojoman/degasho_dojoman.png'),
	                    Image.load('images/dojoman/tokkii_dojoman.png'),
	                    Image.load('images/dojoman/nagachi_dojoman.png'),
	                    Image.load('images/dojoman/miwa_dojoman.png')]
	  @type = Array.new
	  @counter = 0
	 end

     def play
       self.draw
     end

	 def draw
	  @dojoman = @score.to_i / @price #(dojoman = @ / @price) ドジョマンを買う

	  @dojoman.times do |i|  #買ったドジョマンの数だけ画像表示
	    if @counter == 0
	      @type[i] = rand(5)
	    end
	    y, x = i.divmod(6)
	    Window.draw(@x+100*x, @y+100*y, @dojoman_image[@type[i]])
	  end
	  Window.draw_font(100, 450, "    #{@dojoman}個買えたニャ！", @font)
	  @counter = 1
	 end
	end
end