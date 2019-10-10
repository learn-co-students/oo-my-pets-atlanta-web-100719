
require "pry"

class Owner
  attr_accessor :cats, :dogs
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @cats = []
    @dogs = []
    save
  end

  def save
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def buy_cat(name)
    # binding pry
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def change_moods(pets, mood)
    pets.each do |pet|
      pet.mood = mood
    end
  end

  def remove_pets(pets, mood)
    pets.each do |pet|
      pet.mood = mood
      pet.owner = nil
    end
    pets.clear
  end

  def walk_dogs
    change_moods(@dogs, "happy")
  end

  def feed_cats
    change_moods(@cats, "happy")
  end

  def sell_pets
    remove_pets(@dogs, "nervous")
    remove_pets(@cats, "nervous")
  end

  def list_pets
    "I have #{@dogs.count} dog(s), and #{@cats.count} cat(s)."
  end
end
