class SgfService

    def initialize(board_size, player1_name, player2_name)
        komi = 6.5

        sgf_file = "(;GM[1]SZ[#{board_size}]KM[#{komi}]RU[JP]\n" + \
            "PB[#{player1_name}]\n" + "PW[#{player2_name}]\n"

            
    end
    
end