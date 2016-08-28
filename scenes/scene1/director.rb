require_relative '../grand.rb'
require_relative '../hero/sprite_neko.rb'
require_relative '../character/sprite_dojoh.rb'
require_relative '../character/sprite_coin.rb'
require_relative '../director'

module Scene1	
	class Director1 < Director
		include SceneUtil
		WINDOW_WIDTH = 800
		BOTTOM = 520
		def initialize
			@bg = Background.new(0,0, "images/bg/izumo2.png")
			@bgm = Sound.new("sound/shigh.mid")
			super
			#@bg_img = Image.load("images/bg/izumo2.png")
			#ドジョウ３匹生成 & 格納
			@dojoh = Array.new
			3.times {@dojoh << Dojoh.new(rand(1500), rand(300..BOTTOM))}
			@chars << @dojoh
			#コイン生成 & 格納
			@coins = Array.new
			3.times {@coins << Coin.new(rand(1500), rand(200..BOTTOM))}
			@chars << @coins
			@bgm.play
		end

		def play
			super
			Sprite.check(@hero, @coins)
			Sprite.check(@dojoh, @hero)
			Sprite.check(@hero, @pitem)
			@dojoh.each{|fish| fish.ptime(@pitem[0])}
			@dojoh.each{|fish| fish.dojoman}
		end
	end
end