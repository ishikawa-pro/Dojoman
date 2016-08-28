require_relative 'sprite_neko'
require_relative 'character'

class Player < Character
  attr_reader :life, :score

  def initialize
    image = Image.load(image_path("neko.png"))
    image.set_color_key(C_WHITE)
    super(1, 1, image)
    @life = 3
    @score = 0
  end

  def update
    #map = Director.instance.map
    dy = -1 if Input.key_push?(K_UP) #&& map.movable?(@cell_x, @cell_y-1)
    dy = 1  if Input.key_push?(K_DOWN) #&& map.movable?(@cell_x, @cell_y+1)
    dx = 1  if Input.key_push?(K_RIGHT) #&& map.movable?(@cell_x+1, @cell_y)
    dx = -1 if Input.key_push?(K_LEFT) #&& map.movable?(@cell_x-1, @cell_y)
    move_cell(dx: dx, dy: dy)
  end

  # コインを取ったとき
  def shot(obj)
    @score += 1
  end

  # 敵に当たったとき
  def attacked(obj)
    @life -= 1
    if @life < 1
      vanish
      return
    end
    @cell_x = 1
    @cell_y = 1
    self.x = @cell_x * @image.width
    self.y = @cell_y * @image.height
  end
end
