class Player
  FIRST = 'First'.freeze
  SECOND = 'Second'.freeze

  private

  def initialize(type, name, order)
    @type = type
    @name = name
    # order => 1
    # @FIXME: need validation
    @order = order
  end

  public

  def self.first(type, name)
    Player.new(type, name, self::FIRST)
  end
  
  def self.second(type, name)
    Player.new(type, name, self::SECOND)
  end

  attr_reader :name, :order
end
