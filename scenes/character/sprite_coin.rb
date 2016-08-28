class Coin < Sprite
  BOTTOM = 520
  attr_accessor :type
  def initialize(x, y, image = nil)
    @@imanum = [Image.load("images/items/gold.png"),Image.load("images/items/silver.png"),Image.load("images/items/copper.png")]
    image = @@imanum[0]
    image.set_color_key([255, 255, 255])
    image = @@imanum[1]
    image.set_color_key([255, 255, 255])
    image = @@imanum[2]
    image.set_color_key([255, 255, 255])
    @type = rand(3)
    image = @@imanum[@type]
    @sound = Sound.new("sound/coin.wav")
    super
    @dx = 1
  end

  def update
    self.x -= (rand(3) + 1) * @dx
    if self.x < 0
        coinrand = rand(10)#コインの出現率調整
        if coinrand < 5
            @type = 2
        elsif coinrand <8
            @type = 0
        else
            @type = 1
        end
        self.image = @@imanum[@type]
        self.x = rand(800..1400)
        self.y = rand(200..BOTTOM)
    end
    #@dx = -@dx if self.x > (Window.width - self.image.width) || self.x < 0
  end

  def dojoman
    if @type < 3
      @type = rand(3..8)
    end
  end 
  
  def hit(obj)
    #@dx = -@dx if obj.is_a?(Ninjin)
    self.x = rand(800..1000)
    self.y = rand(200..BOTTOM)
    coinrand = rand(10)#コインの出現率調整
    if coinrand < 5
        @type = 2
    elsif coinrand <8
        @type = 0
    else
        @type = 1
    end
    self.image = @@imanum[@type]
    @sound.play
  end
end
