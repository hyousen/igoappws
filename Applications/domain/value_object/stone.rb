# Moveクラスに集約?
class Stone
  FIRST_PLAYER = 'Black'.freeze
  SECOND_PLAYER = 'White'.freeze

  private

  def initialize(stone_color)
    @color = stone_color
  end

  public

  def self.black
    Stone.new(Stone::FIRST_PLAYER)
  end

  def self.white
    Stone.new(Stone::SECOND_PLAYER)
  end

  attr_reader :color

  def ==(other)
    @color == other.color
  end

  def black?
    @color == FIRST_PLAYER
  end

  def white?
    @color == SECOND_PLAYER
  end
end
