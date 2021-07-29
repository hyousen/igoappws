require_relative './game_config'
require_relative './move'
require_relative './player'
require_relative '../../service/sgf_service/sgf_service'

class Sgf

    def initialize(config, player1, player2) 
        @board_size = config.formal_board_size
        @player1_name = player1.name
        @player2_name = player2.name

        SgfService.new(@board_size, @player1_name, @player2_name)

    end

    def update(move)
        stone = move.stone
        position = move.position

        sgf_edit(stone, position)
        
    end
    
end