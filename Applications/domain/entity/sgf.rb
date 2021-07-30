require_relative './game_config'
require_relative './move'
require_relative './player'
require_relative '../../service/sgf_service/sgf_service'
require_relative './sgf_file'

class Sgf

    def initialize(config, player1, player2)
        @sgf = SgfFile.new(config, player1, player2)
    end

    def update(move)
        stone = move.stone
        position = move.position

        @sgf.edit_sgf_file(stone, position)
        @sgf.show_sgf_file
    end
end