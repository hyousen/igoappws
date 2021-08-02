class GameRecord

  @@tekazu = 0
  @@moves = []
  @@removed = []
  # komiはGameRecordに記述してみました
  @@komi = 6.5

  def initialize; end

  # クラスメソッドの private は class << self private や private_class_method を使用するべき
  # @see https://blog.agile.esm.co.jp/entry/2016/09/30/171444

  # setter

  def self.record_move(move)
    @@tekazu += 1
    @@moves.insert(@@tekazu, move)
  end

  # getter

  def self.tekazu
    @@tekazu
  end

  def self.moves
    @@moves
  end

  def self.komi
    @@komi
  end
end
