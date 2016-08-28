class Pitem < Sprite
  attr_reader :timer
  def initialize(x,y,image = nil)
##変更
    @sound = Sound.new('sound/item.wav') #音のファイルを読み込む
    imanum = [Image.load("images/items/degasho_sijimi.png"),Image.load("images/items/tokkii_ebi.png")]
    image = imanum[rand(2)]
##
    super
    @dx = 1
    @findtimer =  10
    @timer = 0
  end

  def update
    if @findtimer < 0
      self.x -= @dx
    else
      @findtimer -= 1
    end
    if self.x < 0
        self.x = 810
        self.y = rand(300..550)
        @findtimer = 60 * 10
    end
    if @timer >0
        @timer -= 1
    end
    #p @timer 
    #p @findtimer
  end

  def hit(obj)
##変更
    @sound.play #音が再生される
####
    @timer = 60 * 5
    self.x = 810
    self.y = rand(300..550)
    @findtimer = 60 * 13
  end

end