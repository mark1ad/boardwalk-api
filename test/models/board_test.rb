require 'test_helper'

class BoardTest < ActiveSupport::TestCase
  test "presense of name" do
    board = Board.create({})
    assert !board.valid?, "Board should not be valid without a name"
  end

  test "validity" do
    board = Board.create({name: "board"})
    assert board.valid?, "Board should be valid"
  end

  test "name" do
    board = Board.create({name: ""})
    board.name = "Boardwalk"
    assert_equal board.name, "Boardwalk", "name method screwed up"
  end

  test "should not save without name" do
    board = Board.new
    assert_not board.save, "Saved the board without a name"
  end
end
