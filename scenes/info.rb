require 'dxruby'
class Info
 attr_accessor :life
 attr_accessor :score
 attr_accessor :time

 def initialize(life = 3, score = 0, margin_y = 0)
  @life = life
  @score = score
  @margin_y = margin_y
  @font = Font.new(32)
 end

 #体力について
 def life_down

if @life == 1
    #ゲームオーバーの画面
	@life = 0
	puts "ゲームオーバー"
else
	@life -= 1
    end
 end

 #スコアについて
=begin def score
  if #お金を拾った時の処理を書く
   socore = score # +お金の処理
  end

  if #敵に当たった時の処理を書く
   score = socore * 0.9
  end
 end
=end
 
 def draw
	if @life == 3
		life_icon = "○○○"
	elsif @life == 2
		life_icon = "○○"
	elsif @life == 1
		life_icon = "○"
	end
    Window.draw_font(10, @margin_y + 600, "いのち： #{life_icon}", @font)
    Window.draw_font(300, @margin_y + 600, "おかね： #{@score}円", @font)
 end
end