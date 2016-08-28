require_relative '../grand.rb'
require_relative '../hero/sprite_neko.rb'
require_relative '../character/sprite_aji.rb'
require_relative '../character/sprite_coin.rb'
module Scene2	
	class Director2 < Director
		include SceneUtil
		def initialize
			@bg = Background.new(0,0, "images/bg/shinjiko2.png")
			super
			#アジ
			@aji = Array.new
			4.times do |i| @aji << Aji.new(i*300,rand(800) ) end
			@chars << @aji
			#コイン生成 & 格納
			@coins = Array.new
			5.times {@coins << Coin.new(rand(1500), rand(200..BOTTOM))}
			@chars << @coins
		end

		def play
			super
			Sprite.check(@hero, @coins)
			Sprite.check(@aji, @hero)
            Sprite.check(@hero, @pitem)
            @aji.each{|fish| fish.ptime(@pitem[0])}
			@aji.each{|fish| fish.dojoman}			
		end
	end
end