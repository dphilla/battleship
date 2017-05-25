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

  def set_ship1
    input1 = @board.keys.sample 
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
  end

  def set_ship2
    input1 = @board.keys.sample
    input2 = @board.keys.sample
      if board[input1] == "S"|| board[input2] == "S"
        set_ship2
      else
      end
      board[input1] = "S"
    valid_coord = next_coord_is_repeat?(input1, input2)
    valid_coord = end_coord_is_valid?(input1, input2)
      board[valid_coord] = "S"
    fill_between_coordinates(input1, input2)
    @board
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
          next_coord = @board.keys.sample
        end
      end
    next_coord
  end

  def fill_between_coordinates(input1, input2)
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

  def next_coord_is_repeat?(input1, input2)
        if input1[0] == input2[0] && input1[1] == input2[1]
          input2 = @board.keys.sample
        else
          valid_coord = true
        end
    input2
  end

  def second_coord_valid?(ship_coord, valid_coord)
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
          next_coord = @board.keys.sample
        end
      end
    next_coord
  end

end
