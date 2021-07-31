require_relative './game_config'
require_relative './player'
require_relative '../value_object/board_position'
require_relative './sgf'
require 'bigdecimal'
require 'bigdecimal/util'

class SgfFile

    def initialize(config, player1, player2)
        board_size = config.formal_board_size
        komi = config.komi
        player1_name = player1.name
        player2_name = player2.name
        #　sgfファイルを初期化
        #　はじまりは、(;で
        #　GM[1]というのは「囲碁」をするという意味　
        @sgf_file = "(;GM[1]SZ[#{board_size}]KM[#{komi}]RU[JP]\n" 
        add_sgf_file("PB[#{player1_name}]\n")
        add_sgf_file("PW[#{player2_name}]\n")
    end

    def add_sgf_file(source)
        @sgf_file = @sgf_file + source
    end

    def edit_sgf_file(stone, position)
        player = stone.black? ? "B" : "W"
        point_x = encode_sgf(position.table_row)
        point_y = encode_sgf(position.table_col)
        #　;が一手のはじまり
        #　プレイヤーが黒番で打った場所が(4，4)なら、;B[dd]と記憶される
        add_sgf_file(";#{player}[#{point_x}#{point_y}]")
    end

    def encode_sgf(value)
        #　ASCIIコードをもとに、1~19の整数値をa~zに変換
        #　前回の方法ではうまくいってなかったので修正
        (value + 96).chr
    end

    def show_sgf_file
        puts @sgf_file
    end
end