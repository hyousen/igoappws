require_relative '../../module/board_image_config'

# @FixMe 複雑なので factory に切り出すべき？
# @FixMe Moveクラスに集約?
class BoardPosition
  include BoardImageConfig
  def initialize(board, point_x, point_y)
    # 後に使わなかったら@point_xと@point_yは消す予定
    @point_x = point_x
    @point_y = point_y
    @table_row = table_num(board.size, point_x)
    @table_col = table_num(board.size, point_y)
  end

  private

  def table_num(board_size, dec)
    board_size.times do |int|
      return int if dec >= int * BoardImageConfig::BOARD_IMAGE_SIZE && dec < (int + 1) * BoardImageConfig::BOARD_IMAGE_SIZE
    end
  end

  public

  attr_reader :row, :col, :table_row, :table_col

  def ==(other)
    @row == other.row && @col == other.col
  end
end
