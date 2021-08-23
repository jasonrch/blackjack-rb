#!/usr/bin/env ruby
require 'pry'
puts "Welcome to Blackjack!"

class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suite = suit
  end

  def outout_card
    puts "#{self.rank} of #{self.suit}"
  end
end

class Deck
  attr_reader :card
  def initialize
    @deck = []
    suits = ["spades", "diamonds", "hearts", "clubs"]
    ranks = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]

    suits.each do |suit|
      ranks.each do |rank|
        card = Card.new(rank, suit)
        @deck << card
      end
    end
  end

  def get_deck
    @deck.each do |card|

      card
    end
  end

end

class DeckBoot
attr_reader :deck
  def initialize
    @boot = []
    boots = 0
    begin
      @deck = Deck.new

      @boot << @deck.get_deck

      boots += 1
    end until boots == 6
    @boot = @boot.flatten.shuffle!
  end

  def draw_card
      @player_card = @boot.shift
      puts "Boot count is now at #{@boot.count}"
      @player_card
  end

  def count
    @boot.count
  end

end


class Blackjack
  attr_reader :boot
    def initialize
     @boot = DeckBoot.new
     @score = 0
     @cards = []
    end

    def play_game
      @cards << boot.draw_card
      binding.pry
    end


end

play = Blackjack.new
play.play_game