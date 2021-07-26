class Move
  def initialize(stone, position)
    # @FIXME: バリデーション
    @stone = stone
    @board_position = position
  end

  attr_reader :stone

  def position
    @board_position
  end

end
