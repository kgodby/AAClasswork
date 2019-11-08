require "card"

describe Card do
  subject(:card) { Card.new(:diamonds, 10) }
  
  describe "#initialize" do
    it "should assign a suit" do
      expect(subject.suit).to eq(:diamonds)
    end

    it "should assign a value" do
      expect(subject.value).to eq(10)
    end

  end
end