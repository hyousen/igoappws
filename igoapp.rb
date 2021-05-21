 require 'gosu'
require './board.rb'

TABLE_SIZE = 11
WIDTH_MARGIN = 0

class Igo < Gosu::Window

	@@igoBoardImage = Gosu::Image.new("igo9roban.png")

	def initialize
		super 480, 480
		self.caption = "囲碁アプリ"
		@board = Board.new
  	end

	def update
		if Gosu::button_down?(Gosu::MsLeft)
			x = mouse_x
			y = mouse_y
			@board.place(x,y)
		end
	end

	def draw
		@@igoBoardImage.draw(0,0,0)
		@board.draw
	end

end

Igo.new.show
