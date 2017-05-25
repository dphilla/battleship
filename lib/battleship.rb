require_relative 'computer_board'
require_relative 'player_board'
require_relative 'game_message'




class BattleShip < Message::BattleMessage
  attr_accessor :player_board,
                :comp_board

  def initialize
    @player_board = PlayerBoard.new #can call the set_player_board here?
    @comp_board = ComputerBoard.new # /same
  end

  def whole_game
    start_game
      game_end = false
      until game_end == true
        print_gridd
        player_shoots
        computer_shoots
      end
    end_game
  end


  #private

  def start_game
    start_message
    start = false
    until start == true
      start_input = gets.chomp
      if start_input == "p" || start_input == "play"
        setup_boards; start = true
      elsif start_input == "i" || start_input == "instructions"
        general_instructions
      elsif start_input == "q" || start_input == "quit"
        game_over; start = true # how do I make this section throw to ending the game without play?
      else
        puts "That is not a valid choice. Try again."
      end
    end
  end


#build display methods, inegrate
#run top to bottom


  def setup_boards
    @comp_board = @comp_board.set_comp_board
    @player_board = @player_board.set_player_board
  end

  def player_shoots
    how_to_shoot_instructions
    shot = gets.chomp
    coordinate_is_on_board(shot)
    if @comp_board[shot] == "S"
      @comp_board[shot] = "H"
      hit_message
    elsif @comp_board[shot] == "H" || @comp_board[shot] == "M"
      puts "you already shot at that location!"
      player_shoots  #yes! recursion! woooo!
    else
      @comp_board[shot] = "M"
      miss_message
    end
    make_game_end(@comp_board)
  end


  def computer_shoots
    shot = @player_board.keys.sample
    if @player_board[shot] == "S"
      @player_board[shot] = "H"
    elsif @player_board[shot] == "H" || @player_board[shot] == "M"
      computer_shoots  #yes! recursion! woooo!
    else
      @player_board[shot] = "M"
    end
    make_game_end(@player_board)
  end

  def coordinate_is_on_board(coord)
    valid = false
    until valid == true
      if @player_board.keys.include?(coord) == false
        puts "That one is not on the board!"
        coord = gets.chomp
      else
        valid = true
        coord
      end
    end
  end

  def make_game_end(which_board)
    if which_board.values.include?("S") == false
      game_end = true
      congrats_message
      end_game
      game_over
    else
      game_end = false
    end
  end

  def end_game
    puts congrats_message
    #number of shots taken
    #total gameplay time
  end

  def end_game_no_play

  end

  def print_player_board(state_of_board)
    state_of_board
  end

  def print_comp_cord(state_of_board)
    state_of_board

  end

  def print_gridd #Why cant this call on comp_board hash, fix after fixing stack error
    @comp_board
    if @comp_board.values.include?("S")   # how can I do this without changing the @comp_board_hash
      @comp_board.values.map.with_index do |x, i|
        if x == "S"
          @comp_board.delete_at(i)
          @comp_board.insert(i, " ")
        else
        end
      end
    end

    puts "\nYour turn! \n===========\n"
    puts ". 1 2 3 4"
    print "A "
    temp_hash.values[0..4].each { |x| print x.to_s +  " "}
    print "\nB "
    temp_hash.values[4..7].each { |x| print x.to_s +  " "}
    print "\nC "
    temp_hash.values[8..11].each { |x| print x.to_s +  " "}
    print "\nD "
    temp_hash.values[12..15].each { |x| print x.to_s +  " "}
    puts "\n===========\n"
  end



    # do I need a similar (to ^^) for comp?
end

instance = BattleShip.new
require 'pry'; binding.pry
