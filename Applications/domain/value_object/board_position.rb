require_relative '../../module/board_image_config'

# @FixMe 複雑なので factory に切り出すべき？
# @FixMe Moveクラスに集約?
# @FixMe バリデーション
class BoardPosition
  include BoardImageConfig
  def initialize(board, point_x, point_y)
    board_size = board.size
    @table_row = table_num(board_size, point_x)
    @table_col = table_num(board_size, point_y)
  end

  private

  def table_num(board_size, dec)
    board_size.times do |int|
      if dec >= int * BoardImageConfig::BOARD_IMAGE_SIZE \
        && dec < (int + 1) * BoardImageConfig::BOARD_IMAGE_SIZE
        return int
      end
    end
  end

  public

  attr_reader :table_row, :table_col

  def ==(other)
    @table_row == other.table_row && @table_col == other.table_col
  end
end
