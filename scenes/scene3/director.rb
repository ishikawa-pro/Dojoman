require_relative '../grand.rb'
require_relative '../hero/sprite_neko.rb'
require_relative '../character/sprite_dojoh.rb'
require_relative '../character/sprite_coin.rb'
require_relative '../../scene'
module Scene3	
	class Director3 < Director
		include SceneUtil
		def initialize
			@bg = Background.new(0,0, "images/bg/aquas2.png")
			super
			#ドジョウ３匹生成 & 格納
			@dojoh = Array.new
			3.times {@dojoh << Dojoh.new(rand(1500), rand(300..BOTTOM))}
			@chars << @dojoh
			#アジ
			@aji = Array.new
			4.times do |i| @aji << Aji.new(i*300,rand(800) ) end
			@chars << @aji
			#Coin
			@coins = Array.new
			8.times { @coins << Coin.new(rand(1200), rand(200..BOTTOM) ) }
			@chars << @coins
		end

		def play
			super
			Sprite.check(@hero, @coins)
			Sprite.check(@dojoh, @hero)
			Sprite.check(@aji, @hero)
            Sprite.check(@hero, @pitem)
            @aji.each{|fish| fish.ptime(@pitem[0])}
            @dojoh.each{|fish| fish.ptime(@pitem[0])}
            @dojoh.each{|fish| fish.dojoman}
            @aji.each{|fish| fish.dojoman}
		end
	end
end