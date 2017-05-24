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

  def set_ship1 #need to check all edge cases (in restraints)
    @board
    ship_coord = gets.chomp
    coordinate_is_on_board(ship_coord)
    board[ship_coord] = "S"
    valid_coord = next_coord_is_repeat?(ship_coord)
    valid_coord = second_coord_valid?(ship_coord, valid_coord)
    board[valid_coord] = "S"
    @board
  end

  def set_ship2 #inlcude next_coord_is_repeat, rewrite second_coord_valid for +/-2, blocking wrapping around board
    ship_coord = gets.chomp
    coordinate_is_on_board(ship_coord) # and is not filled
    board[ship_coord] = "S"
    valid_coord = next_coord_is_repeat?(ship_coord)
    valid_coord = end_coord_is_valid?(ship_coord, valid_coord) # and is not filled
    board[end_coord] = "S"
    #fill interum spot on board with method here, if value of that key == "S", no good, in fact check all methods for this
  end

  #make private 
  def end_coord_is_valid?(ship_coord, valid_coord)
    ship_coord
    next_coord = valid_coord
    letter_check = Array("A".."Z")
      coord_is_good = false; until coord_is_good == true
        if letter_check[letter_check.index(ship_coord[0])+2] == next_coord[0] || letter_check[letter_check.index(ship_coord[0])-2] == next_coord[0]
          coord_is_good = true
          next_coord
        elsif ship_coord[1].to_i + 2 == next_coord[1].to_i || ship_coord[1].to_i - 2 == next_coord[1].to_i
          coord_is_good = true
          next_coord
        else
          coord_is_good = false
          puts "That is not a valid coordinate"
          next_coord = gets.chomp
        end
      end
    next_coord
  end


#submethods for ^^ make private
    def coordinate_is_on_board(coord)
      until valid == true
        if board.keys.include?(coord) == false
          puts "That one is not on the board!"
          coord = gets.chomp
        else
          valid = true
          coord
        end
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
          puts "That is not a valid coordinate"
          next_coord = gets.chomp
        end
      end
    next_coord
  end



# instance = PlayerBoard.new
# instance.setup_board(4)
#
# require 'pry'; binding.pry
