class Neko < Sprite
  BOTTOM = 520
  HERO_WIDTH = 30
  GOLD_COIN = 0
  SILVER_COIN = 1
  COPPER_COIN = 2
  GOLD_COIN2 = 11
  SILVER_COIN2 = 10
  COPPER_COIN2 = 12
  
  attr_accessor :life
  attr_accessor :score
  def initialize(x, y, image = nil)
	@life = 3
	@score = 0
    @imanum = [Image.load("images/shimanekko/degasho_shimanekko1.png"),
               Image.load("images/shimanekko/tokkii_shimanekko.png"),
               Image.load("images/shimanekko/isshy_simanekko.png"),
               Image.load("images/shimanekko/nagachi_shimanekko.png"),
               Image.load("images/shimanekko/miwa_shimanekko.png")]
    image = @imanum.sample
    
    @damage_sound = Sound.new("sound/enemy.wav")
	@coin_sound = Sound.new("sound/coin.wav")
    super
    @dx = 1
  end

  def update
    if Input.key_down?(K_SPACE) || Input.key_down?(K_UP)
      self.y -= 10 if self.y > 0
    else 
     if self.y < BOTTOM
       self.y += 2
     else
      self.y = BOTTOM
     end    
    end
	
	
    self.x += 5  if Input.key_down?(K_RIGHT) if self.x < (Window.width - HERO_WIDTH)
    self.x -= 5  if Input.key_down?(K_LEFT) if self.x > 0
    self.y += 5 if Input.key_down?(K_DOWN)
    @dx = -@dx if self.x > (Window.width - self.image.width) || self.x < 0
    #self.y =100 # Math.sin(self.x / 10) * 5
  end

  def hit(obj)
    #@dx = -@dx
	if 	obj.kind_of?(Coin)
		if(obj.type == GOLD_COIN)
			@coin_sound.play
			@score += 100
		elsif(obj.type == SILVER_COIN)
			@coin_sound.play
			@score += 50
		elsif(obj.type == COPPER_COIN)
			@coin_sound.play
			@score += 10
		else
			@damage_sound.play
			@life -= 1
			@score *= 0.9
		end
	else
		if(obj.type == GOLD_COIN2)
			@coin_sound.play
			@score += 100
		elsif(obj.type == SILVER_COIN2)
			@coin_sound.play
			@score += 50
		elsif(obj.type == COPPER_COIN2)
			@coin_sound.play
			@score += 10
		else
			@damage_sound.play
			@life -= 1
			@score *= 0.9
		end
	end
		obj.x = -1
  end

  def shot(obj)
	if obj.kind_of?(Pitem)
		return
	end
	if(obj.type == GOLD_COIN)
		@coin_sound.play
		@score += 100
	elsif(obj.type == SILVER_COIN)
		@coin_sound.play
		@score += 50
	elsif(obj.type == COPPER_COIN)
		@coin_sound.play
		@score += 10
	end
	
  end

end
