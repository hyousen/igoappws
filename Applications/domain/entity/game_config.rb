class GameConfig
  def initialize(player_number, computer_number, formal_board_size, init_timer)
    @player_number = player_number
    @computer_number = computer_number
    @formal_board_size = formal_board_size
    @board_size = formal_board_size + 2
    @init_timer = init_timer
  end

  attr_reader :player_number, :board_size, :formal_board_size
end
