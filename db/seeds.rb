# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

########
# Art from Light board
artBoard = Board.new(name:"Art From Light");
artBoard.save;

tasklist = Tasklist.new(name:"Backlog", board_id: artBoard.id);
tasklist.save;

task = Task.new(name: "task1", tasklist_id: tasklist.id);
task.save;
task = Task.new(name: "task2", tasklist_id: tasklist.id);
task.save;
task = Task.new(name: "task3", tasklist_id: tasklist.id);
task.save;

tasklist = Tasklist.new(name:"In Progress", board_id: artBoard.id);
tasklist.save;

task = Task.new(name: "task4", tasklist_id: tasklist.id);
task.save;

tasklist = Tasklist.new(name:"Done", board_id: artBoard.id);
tasklist.save;

########
# Boardwalk board
boardBoard = Board.new(name:"Boardwalk");
boardBoard.save;

tasklist = Tasklist.new(name:"Backlog", board_id: boardBoard.id);
tasklist.save;

#######
# Chess board
board = Board.new(name:"Chess");
board.save;
