require_relative "card"

class Deck  

  attr_reader :cards

  def initialize
    @cards = Array.new(52) {Card.new('suit', 'value')}
  end
  
  def self.construct_deck
    
  end

  def shuffle

  end


end

