# require_relative 'battleship'

class PlayerBoard
  attr_accessor :board

  def initialize
    @board = nil
  end

  def setup_board(size)
      letters = Array ('A'..'Z')
      hash = {}

      size.times do |i|
        num = i+1 ; alpha = letters[i]
        key = alpha+num.to_s
        hash.store(key, nil)
        size.times do |i|
          num = i+1
          key = alpha+num.to_s
          hash.store(key, nil)
        end
      end
      @board = hash
    end

  def set_ship1 #private
    @board
    ship_coord = gets.chomp
    board[ship_coord] = "S"
    @board
    #next, build out next input with constraints
  end

  def set_ship2 #private
  end



end

# instance = PlayerBoard.new
# instance.setup_board(4)
#
# require 'pry'; binding.pry
