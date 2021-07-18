require 'gosu'

class BoardDrawer
  def initialize
    @igo_board_image = Gosu::Image.new('../images/board/igoboard.png')
    @igo_board_plane_image = Gosu::Image.new('../images/board/igoplane.png')
    @igo_board_edge_image = Gosu::Image.new('../images/board/igoboard_edge.png')
    @igo_board_corner_image = Gosu::Image.new('../images/board/igoboard_corner.png')
  end

  private

  def offset(int)
    int * 32
  end

  def draw_total_board(board)
    board_size = board.size
    # 全体に普通の画像を敷き詰める
    board_size.times do |i|
      board_size.times do |j|
        @igo_board_image.draw(offset(i), offset(j), 0)
      end
    end
    draw_board_corner(board)
    draw_board_edge(board)
    draw_board_outside(board)
  end

  def draw_board_corner(board)
    board_size = board.size
    angle = 90
    # コーナーを描画する
    @igo_board_corner_image.draw(offset(1), offset(1), 0)
    @igo_board_corner_image.draw_rot(offset(board_size - 2), offset(1), 0, angle, center_x = 0, center_y = 1)
    @igo_board_corner_image.draw_rot(offset(board_size - 2), offset(board_size - 2), 0, angle * 2, center_x = 1, center_y = 1)
    @igo_board_corner_image.draw_rot(offset(1), offset(board_size - 2), 0, angle * 3, center_x = 1, center_y = 0)
  end

  def draw_board_edge(board)
    board_size = board.size
    angle = 90
    # エッジを描画する
    (2..(board_size - 3)).to_a.each do |num|
      @igo_board_edge_image.draw(offset(num), offset(1), 0)
      @igo_board_edge_image.draw_rot(offset(board_size - 2), offset(num), 0, angle, center_x = 0, center_y = 1)
      @igo_board_edge_image.draw_rot(offset(num), offset(board_size - 2), 0, angle * 2, center_x = 1, center_y = 1)
      @igo_board_edge_image.draw_rot(offset(1), offset(num), 0, angle * 3, center_x = 1, center_y = 0)
    end
  end

  def draw_board_outside(board)
    board_size = board.size
    # 盤の外側を描画する
    board_size.times do |i|
      @igo_board_plane_image.draw(offset(0), offset(i))
      @igo_board_plane_image.draw(offset(i), offset(board_size - 1))
      @igo_board_plane_image.draw(offset(board_size - 1), offset(i))
      @igo_board_plane_image.draw(offset(i), offset(0))
    end
  end

  # boardの石を読み取り、配置するメソッド。
  # のちに中身を実装予定
  def draw_stones(board); end

  public

  def draw(board)
    # 盤を描画
    draw_total_board(board)
    # 石を配置
    draw_stones(board)
  end
end
