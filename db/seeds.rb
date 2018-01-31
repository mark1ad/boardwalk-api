# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

board = Board.new(name:"Backlog");
board.save;
board = Board.new(name:"In Progress");
board.save;
board = Board.new(name:"User Stories");
board.save;
board = Board.new(name:"Review/QA");
board.save;
board = Board.new(name:"Done");
board.save;
board = Board.new(name:"Closed");
board.save;
