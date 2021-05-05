require 'gosu'

IMAGE_SIZE = 32

class Board

	@@wsImage = Gosu::Image.new("whitestone.png")
	@@bsImage = Gosu::Image.new("blackstone.png")
	@@igoBoardImage = Gosu::Image.new("igoboard.png")
	@@igoPlaneImage = Gosu::Image.new("igoplane.png")

	def initialize
		
		@board = Array.new(TABLE_SIZE){ Array.new(TABLE_SIZE,0)}
		@board.each_with_index{ |row,i|
			row.each_with_index {|column,j|
				if i == 0 || i == (TABLE_SIZE - 1) || j == 0 || j == (TABLE_SIZE - 1) then
					@board[i][j] = -1
				end
			}
		}

		@tekazu = 1

	end

	def place(x,y)
		TABLE_SIZE.times do |i|
			TABLE_SIZE.times do |j|
				if x >= i * IMAGE_SIZE && x < (i + 1) * IMAGE_SIZE
					if y >= j * IMAGE_SIZE && y < (j + 1) * IMAGE_SIZE
						@a = i
						@b = j
					end
				end
			end
		end
		if @board[@a][@b] == 0 then
			if @tekazu % 2 == 1 then
				@board[@a][@b] = 1
			else
				@board[@a][@b] = 2
			end
			@tekazu += 1
		end
	end

	def addTekazu
		@tekazu += 1
	end

	def draw
		@board.each_with_index{ |row,i|
			row.each_with_index {|column,j|
				if column == -1 then
					@@igoPlaneImage.draw(i*32 + WIDTH_MARGIN,j*32 + WIDTH_MARGIN,0)
				elsif column == 0 then
					@@igoBoardImage.draw(i*32 + WIDTH_MARGIN,j*32 + WIDTH_MARGIN,0)
				elsif column == 1 then
					@@bsImage.draw(i*32 + WIDTH_MARGIN,j*32 + WIDTH_MARGIN,0)
				elsif column == 2 
					@@wsImage.draw(i*32 + WIDTH_MARGIN ,j*32 + WIDTH_MARGIN,0)
				else 
					@@igoPlaneImage.draw(i*32 + WIDTH_MARGIN,j*32 + WIDTH_MARGIN,0)
				end
			}
		}
	end

end
