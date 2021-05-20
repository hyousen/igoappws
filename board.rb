require 'gosu'

IMAGE_SIZE = 32
OUTSIDE_BOARD = -1
BLANK_POINT = 0
BLACK_STONE = 1
WHITE_STONE = 2


class Board

	@@wsImage = Gosu::Image.new("whitestone.png")
	@@bsImage = Gosu::Image.new("blackstone.png")
	@@igoBoardImage = Gosu::Image.new("igoboard.png")
	@@igoPlaneImage = Gosu::Image.new("igoplane.png")
	@@igoBoardEdgeImage = Gosu::Image.new("igoboard_edge.png")
	@@igoBoardCornerImage = Gosu::Image.new("igoboard_corner.png")

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
				if x >= i * IMAGE_SIZE && x < (i + 1) * IMAGE_SIZE
					if y >= j * IMAGE_SIZE && y < (j + 1) * IMAGE_SIZE
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
				if column == -1 then
					@@igoPlaneImage.draw(i*32 + WIDTH_MARGIN,j*32 + WIDTH_MARGIN,0)
				elsif column == 0 && search(i,j,"Top") == -1 && search(i,j,"Left") == -1 then
					@@igoBoardCornerImage.draw(i*32 + WIDTH_MARGIN,j*32 + WIDTH_MARGIN,0)
				elsif column == 0 && search(i,j,"Top") == -1 && search(i,j,"Right") == -1 then
					@@igoBoardCornerImage.draw_rot(i*32 + WIDTH_MARGIN,j*32 + WIDTH_MARGIN,0,90.0,center_x = 0,cemter_y = 1)
				elsif column == 0 && search(i,j,"Bottom") == -1 && search(i,j,"Right") == -1 then
					@@igoBoardCornerImage.draw_rot(i*32 + WIDTH_MARGIN,j*32 + WIDTH_MARGIN,0,180.0,center_x = 1,cemter_y = 1)
				elsif column == 0 && search(i,j,"Bottom") == -1 && search(i,j,"Left") == -1 then
					@@igoBoardCornerImage.draw_rot(i*32 + WIDTH_MARGIN,j*32 + WIDTH_MARGIN,0,270.0,center_x = 1,cemter_y = 0)
				elsif column == 0 && search(i,j,"Top") == -1 then
					@@igoBoardEdgeImage.draw(i*32 + WIDTH_MARGIN,j*32 + WIDTH_MARGIN,0)
				elsif column == 0 && search(i,j,"Right") == -1 then
					@@igoBoardEdgeImage.draw_rot(i*32 + WIDTH_MARGIN,j*32 + WIDTH_MARGIN,0,90.0,center_x = 0,center_y = 1)
				elsif column == 0 && search(i,j,"Bottom") == -1 then
					@@igoBoardEdgeImage.draw_rot(i*32 + WIDTH_MARGIN,j*32 + WIDTH_MARGIN,0,180.0,center_x = 1,center_y = 1)
				elsif column == 0 && search(i,j,"Left") == -1 then
					@@igoBoardEdgeImage.draw_rot(i*32 + WIDTH_MARGIN,j*32 + WIDTH_MARGIN,0,270.0,center_x = 1,center_y = 0)
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
