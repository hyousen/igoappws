class Board
  def initialize(board_size)
    @board_size = board_size
    @stone_table = Array.new(board_size) { Array.new(board_size) }
  end

  def size
    @board_size
  end

  def stone_table
    @stone_table
  end
end