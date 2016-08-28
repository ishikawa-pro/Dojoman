class Dojoh < Sprite
  BOTTOM = 520
  attr_accessor :type
  attr_accessor :money_flag
  def initialize(x, y, image = nil)
    @sound = Sound.new("sound/enemy.wav")
    @csound = Sound.new("sound/coin.wav") #コインの音
    @@imanum = [Image.load("images/dojo/degasho_dojo.png"),
		Image.load("images/dojo/isshiy_dojo.png"),
		Image.load("images/dojo/miwa_dojo.png"),
		Image.load("images/dojo/nagachi_dojo.png"),
		Image.load("images/dojo/toikkii_dojo.png"),
		Image.load("images/dojoman/degasho_dojoman.png"),
		Image.load("images/dojoman/isshy_dojoman.png"),
		Image.load("images/dojoman/miwa_dojoman.png"),
		Image.load("images/dojoman/nagachi_dojoman.png"),
		Image.load("images/dojoman/tokkii_dojoman.png"),
		Image.load("images/items/silver.png"),
		Image.load("images/items/gold.png"),
		Image.load("images/items/copper.png")]
    @type = rand(5)
    image = @@imanum[@type]
    image.set_color_key([255, 255, 255])
    super
    @dx = 1
    @dojomanflag = 0
  end

  def update
    self.x -= @dx
    if self.x < 0
        self.x = rand(800..1000)
        self.y = rand(300..BOTTOM)
        @type = rand(5)
        self.image = @@imanum[@type]
    end
    if self.x > Window.width
        self.x = rand(800..1000)
        self.y = rand(300..BOTTOM)
        @dx *= -1
        @type = rand(5)
        self.image = @@imanum[@type]
    end
    #@dx = -@dx if self.x > (Window.width - self.image.width) || self.x < 0
    self.y += Math.sin(self.x / 10) * 5
    if self.y > BOTTOM
        self.y = BOTTOM
    end
  end
  def ptime(timer)
    if timer.timer > 0 && @type < 10
      @type = rand(10..12)
      self.image = @@imanum[@type]
	  @money_flag = true
    end
  end

  def dojoman
    @dojomanflag = 1 if Input.key_push?(K_D)
    if @dojomanflag == 1
      if @type < 5
        self.image = @@imanum[@type = rand(5..9)]
      end
    end
  end 



  def hit(obj)
    #@dx = -@dx
	puts "dojo hit"
    if @type < 10
      @sound.play #音が再生される
      self.x = rand(800..900)
      self.image = @@imanum[@type = rand(5)]
    else#コインモードのとき
      @csound.play #音が再生される
      self.x = rand(800..1000)
      self.y = rand(200..BOTTOM)
      self.image = @@imanum[@type = rand(5)]
    end
  end
end
