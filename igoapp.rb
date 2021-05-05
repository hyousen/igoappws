 require 'gosu'
require './board.rb'

TABLE_SIZE = 11
WIDTH_MARGIN = 0

class Igo < Gosu::Window

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
		@board.draw
	end

end

Igo.new.show
