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

  def set_ship1 # sub methods should be made private?
    @board
    ship_coord = gets.chomp
    board[ship_coord] = "S"
    valid_coord = coordinate_is_on_board(ship_coord)
    valid_coord = next_coord_is_repeat?(ship_coord)
    valid_coord = second_coord_valid?(ship_coord, valid_coord)
    board[valid_coord] = "S"
    @board
  end

#submethods for ^^
    def coordinate_is_on_board(coord) #this also needs a loop to return to user input if bad input is given
      if board.keys.include?(coord) == false
        puts "That one is not on the board!"
      else
        coord
      end
    end

  def next_coord_is_repeat?(ship_coord)
    ship_coord
    valid_coord = false
    until valid_coord == true
    next_coord = gets.chomp
    if ship_coord[0] == next_coord[0] && ship_coord[1] == next_coord[1]
      puts "You already plugged in that coordinate!"
    else
      valid_coord = true
    end
    end
    next_coord
  end

  def second_coord_valid?(ship_coord, valid_coord) #make loop until good input
    ship_coord
    next_coord = valid_coord
    letter_check = Array("A".."Z")
    coord_is_good = false; until coord_is_good == true
    if letter_check[letter_check.index(ship_coord[0])+1] == next_coord[0] || letter_check[letter_check.index(ship_coord[0])-1] == next_coord[0]
      coord_is_good = true
      next_coord
    elsif ship_coord[1].to_i + 1 == next_coord[1].to_i || ship_coord[1].to_i - 1 == next_coord[1].to_i
      coord_is_good = true
      next_coord
    else
      coord_is_good = false
      print "That is not a valid coordinate"
      next_coord = gets.chomp
    end
    end
    next_coord
  end

  def set_ship2 #inlcude next_coord_is_repeat, rewrite second_coord_valid for +/-2, blocking wrapping around board
  end



end

# instance = PlayerBoard.new
# instance.setup_board(4)
#
# require 'pry'; binding.pry
