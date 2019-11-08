require "deck"

describe Deck do
  subject(:deck) { Deck.new }
  
  describe "#initialize" do
    it "should create an array of 52 card instances" do
      expect(subject.cards.length).to eq(52)
    end

    it "should make each card's value and suit to be unique" do
      expect()
    end
  end

end