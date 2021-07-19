class Board
  def initialize(board_size)
    @board_size = board_size
    # @Todo stone_tableクラスを作成するべき
    @stone_table = Array.new(board_size) { Array.new(board_size) }
  end

  # ここ辺はサービスに出した方が良さそう
  def exist_stone?(board_position)
    @stone_table[board_position.table_row][board_position.table_col].nil?
  end

  def size
    @board_size
  end

  def stone_table
    @stone_table
  end

  def apply_situation(move)
    p move.stone
    board_position = move.position
    @stone_table[board_position.table_row][board_position.table_col] = move.stone
  end
end