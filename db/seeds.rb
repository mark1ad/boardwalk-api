# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

artBoard = Board.new(name:"Art From Light");
artBoard.save;

tasklist = Tasklist.new(name:"Backlog", board_id: artBoard.id);
tasklist.save;
tasklist = Tasklist.new(name:"In Progress", board_id: artBoard.id);
tasklist.save;
tasklist = Tasklist.new(name:"Done", board_id: artBoard.id);
tasklist.save;

boardBoard = Board.new(name:"Boardwalk");
boardBoard.save;

tasklist = Tasklist.new(name:"Backlog", board_id: boardBoard.id);
tasklist.save;

board = Board.new(name:"Chess");
board.save;
