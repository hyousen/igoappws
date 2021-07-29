
class SGF

    def initialize(player1 ,player2 ,config) 
        board_size = config.formal_board_size
        player1_name = player1.name
        player2_name = player2.name

        sgf_initialize(board_size ,player1_name ,player2_name)

    end

    def update(move)
        stone = move.stone
        position = move.position

        sgf_edit(stone ,position)
        
    end
    
end