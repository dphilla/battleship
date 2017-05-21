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

  def test_can_set_4x4_board_hash
    instance = PlayerBoard.new
    expected = {"A1"=>nil, "A2"=>nil, "A3"=>nil, "A4"=>nil, "B2"=>nil, "B1"=>nil, "B3"=>nil, "B4"=>nil, "C3"=>nil, "C1"=>nil, "C2"=>nil, "C4"=>nil, "D4"=>nil, "D1"=>nil, "D2"=>nil, "D3"=>nil}
    result = instance.setup_board(4)
    assert_equal expected, result
  end

  def can_input_ship_coords
    skip
    instance = PlayerBoard.new
    input = instance.set_ship1
    expected = "S"
    result = input["A1"]
    assert_equal = expected, result
  end
end
