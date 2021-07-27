require 'gosu'
require './domain/entity/game_config'
require './domain/entity/board'
require './service/drawer/board_drawer'
require './domain/entity/player'
require './service/player_action'
require './domain/value_object/board_position'
require './domain/entity/game_record'

class Igo < Gosu::Window
  def initialize
    super 480, 480
    self.caption = '囲碁アプリ'
    @config = GameConfig.new(2, 0, 11, 500)
    # @Todo configのプレイヤー人数による場合わけ
    @player1 = Player.first('human', 'プレイヤー1')
    @player2 = Player.second('human', 'プレイヤー2')
    @board = Board.new(@config.board_size)
  end

  def update
    return unless Gosu.button_down?(Gosu::MsLeft)

    # @FixMe board_positionはmoveに集約する?
    board_position = BoardPosition.new(@board, mouse_x, mouse_y)
    next_tekazu = GameRecord.tekazu + 1
    now_player = next_tekazu.odd? ? @player1 : @player2
    player_action = PlayerAction.new
    player_action.place_stone(@board, now_player, board_position)
  end

  def draw
    board_drawer = BoardDrawer.new
    board_drawer.draw(@board)
  end
end

Igo.new.show
