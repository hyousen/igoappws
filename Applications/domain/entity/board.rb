class Board
  def initialize(board_size)
    @board_size = board_size
    # @Todo stone_tableクラスを作成するべき
    @stone_table = Array.new(board_size) { Array.new(board_size) }
  end

  # ここ辺はサービスに出した方が良さそう
  def no_stone?(board_position)
    @stone_table[board_position.table_row][board_position.table_col].nil?
  end

  def outside?(board_position)
    board_position.table_row.zero? || board_position.table_row == (@board_size - 1) || \
      board_position.table_col.zero? || board_position.table_col == (@board_size - 1)
  end

  def size
    @board_size
  end

  attr_reader :stone_table

  def apply_situation(move)
    board_position = move.position
    @stone_table[board_position.table_row][board_position.table_col] = move.stone
  end
end
