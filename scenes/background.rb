class Background
WINDOW_WIDTH = 1600
  def initialize(x, y, image_file)
    @x, @y = x, y
	@window_width = WINDOW_WIDTH
    @image = Image.load(image_file)
    #@image.set_color_key([0, 0, 0])
    @dx = 0.65
  end

  def move
    @x -= @dx
    #@dx = -@dx if @x > (Window.width - @image.width) || @x < 0
	if @x == (@window_width * -1)
		@x = @window_width
	end
    # @dx = -@dx if @x > 768 || @x < 0  ← 【考察】上記は左記と等しい。なぜこちらの表記を採用しないのだろうか？
	self.draw
  end

  def draw
    Window.draw(@x, @y, @image)
  end
end
