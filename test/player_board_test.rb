gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/player_board'

class PlayerBoardTest < Minitest::Test

  def test_player_can_set_board_from_input
    instance = PlayerBoard.new
    expected = {"A1"=>nil,}
    result = instance.setup_board(1)
    assert_equal expected, result
  end

end
