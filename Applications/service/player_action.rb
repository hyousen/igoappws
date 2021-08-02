require_relative '../domain/entity/game_record'
require_relative '../domain/entity/move'
require_relative '../domain/entity/sgf_file'
require_relative '../domain/value_object/stone'
require 'win32ole'


class PlayerAction

  def initialize; end

  private 

  def place?(board, board_position)
    board.no_stone?(board_position) && \
      !board.outside?(board_position)
  end

  public

  def place_stone(board, player, board_position, sgf)
    if board.outside?(board_position)
      resign(sgf)
    end
    return unless place?(board, board_position)
    
    # ちなみに三項演算子は非推奨
    stone = player.order == 'First' ? Stone.black : Stone.white
    move = Move.new(stone, board_position)
    board.apply_situation(move)
    GameRecord.record_move(move)
  end

  # def pause()
  # end

  def resign(sgf)
      wsh = WIN32OLE.new('WScript.Shell')
      wsh.Popup("終局します")
      sgf.set_record(GameRecord.moves)
      sgf.show_sgf_file
      exit
  end
end
