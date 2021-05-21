require 'gosu'

IMAGE_SIZE = 32
OUTSIDE_BOARD = -1
BLANK_POINT = 0
BLACK_STONE = 1
WHITE_STONE = 2


class Board

	@@wsImage = Gosu::Image.new("whitestone.png")
	@@bsImage = Gosu::Image.new("blackstone.png")

	def initialize
		
		@board = Array.new(TABLE_SIZE){ Array.new(TABLE_SIZE,0)}
		@board.each_with_index{ |row,i|
			row.each_with_index {|column,j|
				if i == 0 || i == (TABLE_SIZE - 1) || j == 0 || j == (TABLE_SIZE - 1) then
					@board[i][j] = OUTSIDE_BOARD
				end
			}
		}

		@tekazu = 1

	end

	def place(x,y)
		TABLE_SIZE.times do |i|
			TABLE_SIZE.times do |j|
				if x >= (i - 1) * IMAGE_SIZE && x < i * IMAGE_SIZE
					if y >= (j - 1) * IMAGE_SIZE && y < j * IMAGE_SIZE
						@a = i
						@b = j
					end
				end
			end
		end
		if @board[@a][@b] == BLANK_POINT then
			if isBlack(@tekazu) then
				@board[@a][@b] = BLACK_STONE
			else
				@board[@a][@b] = WHITE_STONE
			end
			addTekazu
		end
	end

	def addTekazu
		@tekazu += 1
	end

	def isBlack(tekazu)
		tekazu % 2 == 1
	end

	def search(x,y,location)
		if @board[x][y] ==-1 then
			result = nil
		elsif location == "Top" then
			result = @board[x][y-1]
		elsif location == "Right"
			result = @board[x+1][y]
		elsif location == "Bottom"
			result = @board[x][y+1]
		elsif location == "Left"
			result = @board[x-1][y]
		end
		return result
	end

	def draw
		@board.each_with_index{ |row,i|
			row.each_with_index {|column,j|
				if  column == 1 then
					@@bsImage.draw((i - 1) * 32 + WIDTH_MARGIN,(j - 1) * 32 + WIDTH_MARGIN,0)
				elsif column == 2 then 
					@@wsImage.draw((i - 1) * 32 + WIDTH_MARGIN,(j - 1) * 32 + WIDTH_MARGIN,0)
				else
					
				end
			}
		}
	end

end
