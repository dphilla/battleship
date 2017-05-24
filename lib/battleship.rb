require_relative 'computer_board'
require_relative 'player_board'




class BattleShip

  def initialize
    @player_board = PlayerBoard.new
    @comp_board = ComputerBoard.new
  end

  def whole_game
    start_game
    setup_boards
      game_end = false
      until game_end == true
        player_shoots
        computer_shoots
      end
    end_game
  end


  #private

  def start_game

  end

  def setup_boards
    # @comp_board = @comp_board.set_comp_board
    @player_board = @player_board.set_player_board
  end


  def shot_sequence #is this necessary


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

  def print_board(which_board)
    which_board
  end

end

instance = BattleShip.new
require 'pry'; binding.pry
