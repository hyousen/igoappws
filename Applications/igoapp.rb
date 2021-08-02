require 'gosu'
require_relative './domain/entity/game_config'
require_relative './domain/entity/board'
require_relative './service/drawer/board_drawer'
require_relative './domain/entity/player'
require_relative './service/player_action'
require_relative './domain/value_object/board_position'
require_relative './domain/entity/game_record'
require_relative './domain/entity/sgf_file'

class Igo < Gosu::Window
  def initialize
    # 19路盤も全体が見えるように修正
    super 700, 700
    self.caption = '囲碁アプリ'
    @config = GameConfig.new(2, 0, 19, 500)
    # @Todo configのプレイヤー人数による場合わけ
    # プレイヤー1とかだと雰囲気出ないと思ってプレイヤー名に実名を入力ｗ
    @player1 = Player.first('human', 'kshimogai')
    @player2 = Player.second('human', 'hsakuchi')
    @board = Board.new(@config.board_size)
    @sgf = SgfFile.new(@config, @player1, @player2)
  end

  def update
    return unless Gosu.button_down?(Gosu::MsLeft)

    # @FixMe board_positionはmoveに集約する?
    board_position = BoardPosition.new(@board, mouse_x, mouse_y)
    next_tekazu = GameRecord.tekazu + 1
    now_player = next_tekazu.odd? ? @player1 : @player2
    player_action = PlayerAction.new
    # とりあえずplayer_actionにSgfFileインスタンスを渡してます
    # 何かいい改良等あれば言って下さい
    player_action.place_stone(@board, now_player, board_position, @sgf)
  end

  def draw
    board_drawer = BoardDrawer.new
    board_drawer.draw(@board)
  end
end

Igo.new.show
