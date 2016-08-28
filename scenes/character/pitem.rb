class Pitem < Sprite
  attr_reader :timer
  def initialize(x,y,image = nil)
##�ύX
    @sound = Sound.new('sound/item.wav') #���̃t�@�C����ǂݍ���
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
##�ύX
    @sound.play #�����Đ������
####
    @timer = 60 * 5
    self.x = 810
    self.y = rand(300..550)
    @findtimer = 60 * 13
  end

end