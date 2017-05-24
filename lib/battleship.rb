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


#make functional AI,
#shoots, through end game
#build display coords


  def setup_boards
    # @comp_board = @comp_board.set_comp_board
    @player_board = @player_board.set_player_board
  end

  def player_shoots

  end


  def computer_shoots

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

  def print_gridd
    #this needs to be changed to account for nils
    puts ". 1 2 3 4"
    print "A "
    player_board.values[0..4].each { |x| print x.to_s +  " "}
    print "\nB "
    player_board.values[4..7].each { |x| print x.to_s +  " "}
    print "\nC "
    player_board.values[8..11].each { |x| print x.to_s +  " "}
    print "\nD "
    player_board.values[12..15].each { |x| print x.to_s +  " "}
  end

  def print_player_map(board) #make text more interesting, where does this go
      puts "\nYour turn! \n===========\n"
      print_grid(board)
      output.print "\n===========\nEnter a coordinate to shoot at:"
    end

    # do I need a similar (to ^^) for comp?
end

instance = BattleShip.new
require 'pry'; binding.pry
