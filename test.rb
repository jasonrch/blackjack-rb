require 'rspec/autorun'
require_relative './blackjack.rb'

describe Card do
  it "creates a playing card with a rank and suit" do
    card = Card.new("A", "Spades")
  end

end
