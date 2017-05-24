module Message
  class BattleMessage

    def start_message
      "Welcome to BATTLESHIP" + "\n\n" "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    end

    def player_ship_placement_instructions
      p "I have laid out my ships on thi grid." + "\n"
      p "You now need to layout your two ships." + "\n"
      p "The first is two units long and the" + "\n"
      p "second is three units long" + "\n"
      p "The grid has A1 at the !top left and D4 at the bottom right." + "\n\n"
      p "Enter the squares for the two unit ship:"
    end

    def how_to_shoot_instructions
      "Above is the opponent's baord. Enter a coordinate at which to fire."
    end

    def hit_message
      "BOOM! Direct hit! Nice work."
    end

    def miss_message
      "swing-and-a-miss! keep at it."
    end

    def hit_and_sink_message
      "you downed one of your opponents ship! Way to go!"
    end

    def sorry_message
      "Welp, you have let your navy down, literally and figuratively. You lose"
    end

    def congrats_message
      "You sank your opponent's last ship! You Win!"
      #number of shots taken
      #total gameplay time
    end

  end
end

instance = Message::BattleMessage.new
# require 'pry'; binding.pry
instance.player_ship_placement_instructions
