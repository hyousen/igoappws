require_relative '../domain/entity/game_record'
require_relative '../domain/entity/move'
require_relative '../domain/value_object/stone'

class PlayerAction

  def initialize; end

  def place_stone(board, player, board_position)
    return unless board.exist_stone?(board_position)

    # ちなみに三項演算子は非推奨
    stone = player.order == 'First' ? Stone.black : Stone.white
    move = Move.new(stone, board_position)
    board.apply_situation(move)
    GameRecord.record_move(move)
  end

  # def pause()
  # end

  # def resign()
  # end
end
