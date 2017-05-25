# require_relative 'battleship'
require_relative 'game_message'

class PlayerBoard < Message::BattleMessage
  attr_accessor :board

  def initialize
    @board = nil
  end

  def set_player_board
    setup_board(4)
    player_ship_placement_instructions_two_unit
    set_ship1
    player_ship_placement_instructions_three_unit
    set_ship2
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
    ship_input = verify_input_structure
    input1 = ship_input[0]
    input2 = ship_input[1]
    coordinate_is_on_board(input1)
      board[input1] = "S"
    valid_coord = next_coord_is_repeat?(input1, input2)
    valid_coord = second_coord_valid?(input1, input2)
      board[valid_coord] = "S"
      @board
    #new moethod(from where?) your board looks like this:
  end

  def set_ship2 #inlcude next_coord_is_repeat, rewrite second_coord_valid for +/-2, blocking wrapping around board
    ship_input = verify_input_structure
    input1 = ship_input[0]
    input2 = ship_input[1]
    coordinate_is_on_board(input1)
      board[input1] = "S"
    valid_coord = next_coord_is_repeat?(input1, input2)
    valid_coord = end_coord_is_valid?(input1, input2) # and is not filled
      board[valid_coord] = "S"
    fill_between_coordinates(input1, input2)
    @board
    #new_method(from where?): your board looks like this:
  end

  def verify_input_structure    #this could be better
      ship_input = gets.chomp.upcase #this is the only point of entry for user input
        if ship_input.length == 5 || 6
          ship_input = ship_input.split(" ")
          ship_input
        else
          puts "Oops! Try entering that again and watch your spaces and numbers!"
          verify_input_structure
        end
  end


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
          set_player_board
        end
      end
    next_coord
  end

  def fill_between_coordinates(input1, input2) #THIS IS THE LAST PART OF HARD CODING YOU HAVE TO DO!
    letter_check = Array("A".."Z")
      if input1[0] == input2[0]
        num = input1[1].to_i + 1
        inner_key = input1[0] + num.to_s
        inner_key
      else
        next_index = letter_check.index(input1[0]) + 1
        inner_key = letter_check[next_index] + input1[1]
      end
    board[inner_key] = "S"
  end

#submethods for ^^ make private
    def coordinate_is_on_board(coord)
      valid = false
      until valid == true
        if board.keys.include?(coord) == false
          puts "That one is not on the board!"
          set_player_board
        else
          valid = true
          coord
        end
      end
    end

  def next_coord_is_repeat?(input1, input2)
        if input1[0] == input2[0] && input1[1] == input2[1]
          puts "You already plugged in that coordinate!"
          set_player_board
        else
          valid_coord = true
        end
    input2
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
          set_player_board
        end
      end
    next_coord
  end

end
# instance = PlayerBoard.new




# require 'pry'; binding.pry
