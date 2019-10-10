class Dog
  attr_accessor :owner, :mood
  attr_reader :name
  @@all = []

  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    owner.dogs << self
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def buy_dog(name)
    Dog.new(name, self)
  end
end
