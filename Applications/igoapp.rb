require 'gosu'
require './domain/entity/game_config'
require './domain/entity/board'

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
    @board.draw
  end
end

Igo.new.show
