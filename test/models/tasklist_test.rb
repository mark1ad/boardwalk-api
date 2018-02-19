require 'test_helper'

class TasklistTest < ActiveSupport::TestCase
  def test_presense_of_name
    board = Board.create({name: "boardwalk"})
    tasklist = Tasklist.create({board_id: board.id})
    assert !tasklist.valid?
  end

  def test_validity
    board = Board.create({name: "boardwalk"})
    tasklist = Tasklist.create({name: "backlog", board_id: board.id})
    assert tasklist.valid?
  end
end
