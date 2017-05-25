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
      computer_shoots
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

  def print_gridd #THIS DOESN'T WORK!
    @comp_board
    if @comp_board.values.include?("S")
      @comp_board =  @comp_board.each do |value|
      if value == "S"
        new  = @comp_board.replace(value)
        @comp_board[i] = " "
      elsif value == nil
        value = " "
        end #replace needs to be something like gsub, but for hashes
      end
      @comp_board
    end
    @comp_board
    puts "\nIt's your turn! \n===========\n"
    puts ". 1 2 3 4"
    print "A "
    @comp_board.values[0..4].each { |x| print x.to_s +  " "}
    print "\nB "
    @comp_board.values[4..7].each { |x| print x.to_s +  " "}
    print "\nC "
    @comp_board.values[8..11].each { |x| print x.to_s +  " "}
    print "\nD "
    @comp_board.values[12..15].each { |x| print x.to_s +  " "}
    puts "\n===========\n"
    @comp_board
  end

end

instance = BattleShip.new
instance.whole_game
