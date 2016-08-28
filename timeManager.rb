require 'dxruby'
class TimeManager
 attr_accessor :life
 attr_accessor :score
 attr_accessor :time

 def initialize(time = 20, margin_y = 0)
  @start_time = time
  @time = @start_time
  @margin_y = margin_y
  @font = Font.new(32)
  @loop_count = 0
 end


 def clean
  @loop_count = 0
  @time = @start_time
 end


 #残り時間について
 def time_countdown
  @loop_count += 1  
  @time = @start_time - (@loop_count / 60).to_i if @time > 0
 end
 
 def draw
    Window.draw_font(600, @margin_y + 600, "のこり： #{@time}秒", @font)
	if @time == 0
		return false
	end
	return true
 end
end