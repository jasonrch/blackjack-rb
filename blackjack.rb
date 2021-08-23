#!/usr/bin/env ruby
require 'pry'
puts "Welcome to Blackjack!"

class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def output_card
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
     @hand = []
     @dealer_hand = []
     @dealer_score = 0
    end

    def draw_card
      @hand << boot.draw_card
      get_score(@hand[-1])
    end

    def get_score(card)
        if card.rank == "K" || card.rank == "Q" || card.rank == "J"
          @score += 10
        elsif card.rank == "A"
          @score += 11
        else
          @score += card.rank.to_i
        end

        if @score > 21 && @hand.any? { |card| card.rank == "A"}
          @score -= 10
        end
    end

    def deal_hand
      draw_card
      draw_card

      message = "Blackjack"
      puts "You score is #{@score}! with a #{@hand[0].rank} of #{@hand[0].suit} and #{@hand[1].rank} of #{@hand[1].suit}"

      if @score == 21
        return puts message
      else
        hit_me

        if @score > 21
          message = "You busted with a score of #{@score}"
        end

        if score == 21
          message
        end


      end
      binding.pry
      puts message
    end

    def hit_me
      while @score <= 17
        draw_card
        hit_me
      end
    end

end

play = Blackjack.new
play.deal_hand
