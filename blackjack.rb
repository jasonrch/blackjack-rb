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
  end

  def count
    @boot.count
  end

end

class Player
  attr_accessor :score, :hand
  def initialize(name)
    @name = name
    @score = 0
    @hand = []
  end
end

class Blackjack
  attr_reader :boot, :player, :dealer
    def initialize
     @boot = DeckBoot.new
     @player = Player.new("player")
     @dealer = Player.new("dealer")
    end

    def draw_card(player)
      player.hand << boot.draw_card
      get_score(player.hand[-1], player)
    end

    def get_score(card, player)
        if card.rank == "K" || card.rank == "Q" || card.rank == "J"
          player.score += 10
        elsif card.rank == "A"
          player.score += 11
        else
          player.score += card.rank.to_i
        end

        if player.score> 21 && player.hand.any? { |card| card.rank == "A"}
          player.score -= 10
        end
    end

    def deal_hand(keep_playing=true, cards_left=312)
      binding.pry
      draw_card(player)
      draw_card(dealer)
      draw_card(player)
      draw_card(dealer)


      if player.score == 21 && dealer.score != 21
       messae = "Blackjack!"
      elsif   player.score == 21 && dealer.score = 21
        message = "Push Tied blackjack!"
      else
        hit_player(player)
        if player.score > 21
          message = "You busted with a score of #{player.score}"
        else
            cards = []
            player.hand.each do |card|
              cards << "#{card.rank} of #{card.suit}"
            end
        end
      end

      if dealer.score <= 17
        hit_player(dealer)
      end

      if player.score > dealer.score
        message = "You won with a #{player.score} beating the dealer with #{dealer.score}! With a #{cards.join(", ")}!"
      elsif dealer.score > 21
        message = "Dealer bused with #{dealer.score}. You won!"
      elsif player.score < dealer.score
        message = "Dealer won with a #{dealer.score} to your #{player.score}"
      elsif player.score == dealer.score
        message = "Tie score Push!!"
      end

      if keep_playing
        puts message

        player.score = 0
        player.hand = []

        dealer.score = 0
        dealer.hand = []
        binding.pry
        deal_hand(keep_playing)
      else
        puts message
      end
    end


    def hit_player(player)
      while player.score <= 17
        draw_card(player)
        if player.score > 21 && player.hand[-1].rank == "A"
          player.score -= 10
        end
        hit_player(player)
      end
    end

end

play = Blackjack.new
play.deal_hand
