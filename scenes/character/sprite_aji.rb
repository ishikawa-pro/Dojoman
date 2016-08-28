class Aji < Sprite
  BOTTOM = 520
  attr_accessor :type
  def initialize(x, y, image = nil)
    @@imanum = [Image.load("images/aji/isshy_aji.png"),
				Image.load("images/aji/degasho_aji.png"),
				Image.load("images/aji/miwa_aji.png"),
				Image.load("images/aji/nagachi_aji.png"),
				Image.load("images/aji/tokkii_aji.png"),
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
    @v0 = 30
    @v = @v0
    @g = 1
    @count = 1
	@dojomanflag = 0
  end

  def update
    self.x -=  @dx
    self.y -=  @v
    @v -= @g
    if self.x < 0
        @type = rand(5)
        self.image = @@imanum[@type]
        self.x = rand(800..1000)
    end
    if self.y > BOTTOM
        self.y = BOTTOM
        if @count < 3
            @count += 1
        else
            @count = 1
        end
        @v = @count * 10
    end
    #@dx = -@dx if self.x > (Window.width - self.image.width) || self.x < 0
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
