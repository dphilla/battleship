module Message
  class BattleMessage

    def start_message
      puts "Welcome to BATTLESHIP"

      puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    end

    def general_instructions
      puts "These are general_instructions
      .....to continue, enter (p)lay, or (q)uit."
    end

    def player_ship_placement_instructions_two_unit
      puts "I have laid out my ships on thi grid." + "\n"
      puts "You now need to layout your two ships." + "\n"
      puts "The first is two units long and the" + "\n"
      puts "second is three units long." + "\n"
      puts "The grid has A1 at the top left and D4 at the bottom right." + "\n\n"
      puts "Enter the squares for the two unit ship:"
    end

    def player_ship_placement_instructions_three_unit
      puts "Now, enter the first and last sqaures for your three-unit ship:"
    end

    def how_to_shoot_instructions
      puts "Above is the opponent's baord. Enter a coordinate at which to fire."
    end

    def hit_message
      puts "BOOM! Direct hit! Nice work."
    end

    def miss_message
      puts "swing-and-a-miss! keep at it! It's never too late to stop sucking."
    end

    def hit_and_sink_message
      puts "you downed one of your opponents ship! Way to go!"
    end

    def sorry_message
      puts "Welp, you have let your navy down, literally and figuratively. You lose"
    end

    def congrats_message
      puts "You sank your opponent's last ship! You Win!"
      #number of shots taken
      #total gameplay time
    end

    def game_over
      puts "GAME OVER."
    end

  end
end

# instance = Message::BattleMessage.new
# require 'pry'; binding.pry
# instance.player_ship_placement_instructions
