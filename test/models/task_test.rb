require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  def test_presense_of_name
    board = Board.create({name: "board"})
    tasklist = Tasklist.create({name: "list", board_id: board.id})
    task = Task.create({tasklist_id: tasklist.id})
    assert !task.valid?
  end

  def test_validity
    board = Board.create({name: "board"})
    tasklist = Tasklist.create({name: "list", board_id: board.id})
    task = Task.create({name: "do", tasklist_id: tasklist.id})
    assert task.valid?
  end

  def test_description
    board = Board.create({name: "board"})
    tasklist = Tasklist.create({name: "list", board_id: board.id})
    task = Task.create({name: "do",
      tasklist_id: tasklist.id,
      description: "description"
    })
    assert task.valid?
  end
end
