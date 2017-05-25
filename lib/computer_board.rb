# require_relative 'battleship'

#change input variables to receive random imput (.sample)

class ComputerBoard
  attr_accessor :board

  def initialize
    @board = nil
  end

  def set_comp_board
    setup_board(4)
    set_ship1
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
    input1 = @board.keys.sample #loop this for correct ordering of input
    input2 = @board.keys.sample
      if input1 == input2
        set_ship1
      else
      end
      board[input1] = "S"
    valid_coord = next_coord_is_repeat?(input1, input2)
    valid_coord = second_coord_valid?(input1, input2)
      board[valid_coord] = "S"
      @board
    #new moethod(from where?) your board looks like this:
  end

  def set_ship2 #inlcude next_coord_is_repeat, rewrite second_coord_valid for +/-2, blocking wrapping around board
    input1 = @board.keys.sample #only if value == nil here
    input2 = @board.keys.sample
      if board[input1] == "S"|| board[input2] == "S"
        set_ship2
      else
      end
      board[input1] = "S"
    valid_coord = next_coord_is_repeat?(input1, input2)
    valid_coord = end_coord_is_valid?(input1, input2) # and is not filled
      board[valid_coord] = "S"
    fill_between_coordinates(input1, input2)
    @board
    #new_method(from where?): your board looks like this:
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
          valid_coord = @board.keys.sample
          end_coord_is_valid?(ship_coord, valid_coord)
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


  def next_coord_is_repeat?(input1, input2)
        if input1[0] == input2[0] && input1[1] == input2[1]
          input2 = @board.keys.sample
          next_coord_is_repeat?(input1, input2)
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
          valid_coord = @board.keys.sample
          second_coord_valid?(ship_coord, valid_coord)
        end
      end
    next_coord
  end

end
#   attr_accessor :board
#
#   def initialize
#     @board = nil
#   end
#
#   def set_comp_board
#     setup_board(4)
#     set_ship1
#     set_ship2
#   end
#
#
#   def setup_board(size)
#       letters = Array ('A'..'Z')
#       hash = {}
#
#       size.times do |i|
#         num = i+1 ; alpha = letters[i]
#         key = alpha+num.to_s
#         hash.store(key, nil)
#         size.times do |i|
#           num = i+1
#           key = alpha+num.to_s
#           hash.store(key, nil)
#         end
#       end
#       @board = hash
#     end
#
#   def set_ship1 #need to check all edge cases (in restraints)
#     @board
#     ship_coord = @board.keys.sample
#     coordinate_is_on_board(ship_coord)
#     board[ship_coord] = "S"
#     valid_coord = next_coord_is_repeat?(ship_coord)
#     valid_coord = second_coord_valid?(ship_coord, valid_coord)
#     board[valid_coord] = "S"
#     @board
#   end
#
#   def set_ship2 #inlcude next_coord_is_repeat, rewrite second_coord_valid for +/-2, blocking wrapping around board
#     ship_coord = @board.keys.sample
#     coordinate_is_on_board(ship_coord) # and is not filled
#     board[ship_coord] = "S"
#     valid_coord = next_coord_is_repeat?(ship_coord)
#     valid_coord = end_coord_is_valid?(ship_coord, valid_coord) # and is not filled
#     board[valid_coord] = "S"
#     #fill interum spot on board with method here, if value of that key == "S", no good, in fact check all methods for this
#     @board
#   end
#
#
#   private
#
#   def end_coord_is_valid?(ship_coord, valid_coord)
#     ship_coord
#     next_coord = valid_coord
#     letter_check = Array("A".."Z")
#       coord_is_good = false; until coord_is_good == true
#         if letter_check[letter_check.index(ship_coord[0])+2] == next_coord[0] || letter_check[letter_check.index(ship_coord[0])-2] == next_coord[0]
#           coord_is_good = true
#           next_coord
#         elsif ship_coord[1].to_i + 2 == next_coord[1].to_i || ship_coord[1].to_i - 2 == next_coord[1].to_i
#           coord_is_good = true
#           next_coord
#         else
#           coord_is_good = false
#           puts "That is not a valid coordinate"
#           next_coord = @board.keys.sample
#         end
#       end
#     next_coord
#   end
#
#
# #submethods for ^^ make private
#     def coordinate_is_on_board(coord)
#       valid = false
#       until valid == true
#         if board.keys.include?(coord) == false
#           puts "That one is not on the board!"
#           coord = @board.keys.sample
#         else
#           valid = true
#           coord
#         end
#       end
#     end
#
#   def next_coord_is_repeat?(ship_coord)
#     ship_coord
#     valid_coord = false
#       until valid_coord == true
#       next_coord = @board.keys.sample
#         if ship_coord[0] == next_coord[0] && ship_coord[1] == next_coord[1]
#           puts "You already plugged in that coordinate!"
#         else
#           valid_coord = true
#         end
#       end
#     next_coord
#   end
#
#   def second_coord_valid?(ship_coord, valid_coord) #make loop until good input
#     ship_coord
#     next_coord = valid_coord
#     letter_check = Array("A".."Z")
#       coord_is_good = false; until coord_is_good == true
#         if letter_check[letter_check.index(ship_coord[0])+1] == next_coord[0] || letter_check[letter_check.index(ship_coord[0])-1] == next_coord[0]
#           coord_is_good = true
#           next_coord
#         elsif ship_coord[1].to_i + 1 == next_coord[1].to_i || ship_coord[1].to_i - 1 == next_coord[1].to_i
#           coord_is_good = true
#           next_coord
#         else
#           coord_is_good = false
#           puts "That is not a valid coordinate"
#           next_coord = @board.keys.sample
#         end
#       end
#     next_coord
#   end
#
# end
