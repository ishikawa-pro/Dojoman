require 'dxruby'

require_relative 'scene'
require_relative 'scenes/load_scenes'
#require_relative 'info'
require_relative 'timeManager'


Window.caption = "Team Dojoman"
Window.width   = 800
Window.height  = 650
#ゲームスタート判定用
game_started = false
#ゲームプレイ中判定
game_playing = false
game_over = false
#タイトルシーンをセット
Scene.set_current_scene(:title)
#タイマー管理
timer = TimeManager.new


Window.loop do
	#Enterを押したらゲームスタート
 	if Input.keyPush?(K_RETURN) && !game_started
		Scene.set_current_scene(:preparation1)			
		game_started = true
	end
	#現在のシーンを格納
	scene = Scene.get_current_scene
	if scene == :scene1 || scene == :scene2 || scene == :scene3
		game_playing = true
		timer.time_countdown
		#タイムアップでfalseを返す
		game_playing = timer.draw
	end

	if game_playing == false
		if scene == :scene3
			Scene.set_current_scene(:ending)
		end
		timer.clean
		if scene == :scene1
			Scene.set_current_scene(:preparation2)
		elsif scene == :scene2
			Scene.set_current_scene(:preparation3)
		end
	end
			

	
	#Escでゲーム終了
	break if Input.keyPush?(K_ESCAPE)

  Scene.play_scene
end
