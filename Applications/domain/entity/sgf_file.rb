require_relative './game_config'
require_relative './game_record'
require_relative './player'
require_relative './move'
require_relative '../value_object/board_position'

class SgfFile

    def initialize(config, player1, player2)
        formal_board_size = config.formal_board_size
        komi = GameRecord.komi
        player1_name = player1.name
        player2_name = player2.name
        #　sgfファイルを初期化
        #　はじまりは、(;で
        #　GM[1]というのは「囲碁」をするという意味　
        @sgf_file = "(;GM[1]SZ[#{formal_board_size}]KM[#{komi}]RU[JP]\n" 
        add_sgf_file("PB[#{player1_name}]\n")
        add_sgf_file("PW[#{player2_name}]\n")
    end

    def add_sgf_file(source)
        @sgf_file = @sgf_file + source
    end

    def edit_sgf_file(stone, position)
        color = stone.black? ? "B" : "W"
        table_row = encode_sgf(position.table_row)
        table_col = encode_sgf(position.table_col)
        #　;が一手のはじまり
        #　プレイヤーが黒番で打った場所が(4，4)なら、;B[dd]と記憶される
        add_sgf_file(";#{color}[#{table_row}#{table_col}]")
    end

    def encode_sgf(value)
        #　ASCIIコードをもとに、1~19の整数値をa~zに変換
        #　前回の方法ではうまくいってなかったので修正
        (value + 96).chr
    end

    def set_record(moves)
        moves.each do |move|
            # ここもっといい書き方ある？
            if move != nil
                stone = move.stone
                position = move.position
                edit_sgf_file(stone, position)
            end
        end
    end

    def show_sgf_file
        puts @sgf_file
    end

end
