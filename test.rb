require 'rspec/autorun'
require_relative './blackjack.rb'
require 'pry'

describe Card do
  it "creates a playing card with a rank and suit" do
    card = Card.new("A", "Spades")
    expect(card.rank).to  eq("A")
    expect(card.suit).to eq("Spades")
  end
end



describe Deck do
  it "creates a deck of cards" do
    deck = Deck.new
    expect(deck.count).to eq(52)
  end
end

describe DeckBoot do
    boot = DeckBoot.new
  it "creates a 6 deck boot of cards" do
    expect(boot.count).to eq(312)
  end

  it "shuffle the boot" do
    expect(boot.boot).not_to eq(boot.boot.shuffle)
  end

  it "draws a card" do
    boot.draw_card
    expect(boot.count).to  eq(311)
  end
end

describe Player do
  it "creates a player" do
    player = Player.new("name")
    expect(player.score).to  eq(0)
    expect(player.ace_count).to  eq(0)
    expect(player.hand.length).to  eq(0)
  end
end

describe Blackjack do
  play = Blackjack.new

  it "contains a doot of 312 cards that are shuffled" do

    expect(play.boot.boot[0].rank).to_not eq("A") #not perfect
    expect(play.boot.count).to eq(312)
  end

  it "has 2 players" do
    expect(play.player.score).to eq(0)
    expect(play.dealer.score).to eq(0)
  end

  it "drawing a card adds to player hand and reduces boot size" do
    play.draw_card(play.player)
    expect(play.player.hand.length).to  eq(1)
    expect(play.boot.count).to eq(311)
  end

  it "tallys score of hand" do
    play.player.score = 0
    ace = Card.new("A", "Spades")
    five = Card.new("5", "Spades")
    play.get_score(ace, play.player)
    play.get_score(five, play.player)
    expect(play.player.score).to eq(16)
  end

  it "reduces aces when needed" do
    play.player.score = 0
    ace = Card.new("A", "Spades")
    king = Card.new("K", "Spades")
    ten = Card.new("10", "Spades")
    five = Card.new("5", "Spades")
    play.get_score(ace, play.player)
    play.get_score(five, play.player)
    play.get_score(five, play.player)
    play.get_score(five, play.player)

    expect(play.player.score).to  eq(16)
  end
end

