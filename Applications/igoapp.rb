require 'gosu'
require './domain/entity/game_config'
require './domain/entity/board'
require './service/drawer/board_drawer'

class Igo < Gosu::Window
  def initialize
    super 480, 480
    self.caption = '囲碁アプリ'
    @config = GameConfig.new(2, 0, 11, 500)
    @board = Board.new(@config.board_size)
  end

  def update
    if Gosu.button_down?(Gosu::MsLeft)
      x = mouse_x
      y = mouse_y
      @board.place(x, y)
    end
  end

  def draw
    board_drawer = BoardDrawer.new
    board_drawer.draw(@board)
  end
end

Igo.new.show
