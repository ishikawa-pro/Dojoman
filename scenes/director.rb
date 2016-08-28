require_relative 'grand.rb'
require_relative 'background.rb'
require_relative 'hero/sprite_neko.rb'
require_relative 'character/sprite_aji.rb'
require_relative 'character/sprite_coin.rb'
require_relative 'scene_util'
require_relative 'info'
require_relative 'character/pitem.rb'


class Director
	attr_accessor :hero
	include SceneUtil
	WINDOW_WIDTH = 800
	BOTTOM = 520
	def initialize
		@data_synced = false
		@@info = Info.new
		#島根っ子（？）格納と生成
		@hero = Array.new
		@hero << Neko.new(30, BOTTOM)
		#敵とコインの格納用
		@chars = Array.new
        @pitem = Array.new
        @pitem << Pitem.new(810, rand(300..BOTTOM))#パワーアップアイテム
        @chars << @pitem
		@grand1 = Grand.new(0,0, "images/bg/grand.png")
		@grand2 = Grand.new(WINDOW_WIDTH,0, "images/bg/grand.png")
	end

	def play
		if @data_synced == false
			@hero[0].score = @@info.score
			@hero[0].life = @@info.life
			puts @hero[0].life
			@data_synced = true
		end
     	if @hero[0].life < @@info.life
			@@info.life_down
			puts "life Down"
		end
		#scoreをinfoに加算
		if @hero[0].score != @@info.score
			@@info.score = @hero[0].score.to_i
			#puts @@info.score
		end
		if @@info.life == 0
			Scene.set_current_scene(:gameOver)
		end
		@@info.draw
		@bg.move
		@grand1.move
		@grand2.move
	    Sprite.update(@hero)
	    Sprite.draw(@hero)
		Sprite.update(@chars)
		Sprite.draw(@chars)

	end
end
