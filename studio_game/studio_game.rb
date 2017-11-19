require_relative 'game'

# 1. create a game (object) using Game class
# 2. load and add players from csv file
# 3. the game have 6 treasures to be found.
# 4. the game is started by typing on commang line with (optional) csv file containing the players and its' health
# 5. it will ask for how many rounds the game played
# 6. play the game
#    a. print the treasure to be found randomly in the game.
#    b. print the number of player and game title
#    c. print (introduce) each player name with their health, point (from treasure found) and score (health + point)
#    d. each player get a turn to roll a die (result in random number), and base on the resulting number their's health is increased (woot), remained (skiped), or decreased (blam)
#    e. treasure is randomly found (adding point) for each player in each round
# 7. after all rounds is played, it will ask again for no. of round to be played or quit to stop
# 8. when quit, it prints statistics: the strongest and wimpy players, each player treasures and points, and high score.
# 9. the high score statistics is save in a text file.

# player1 = Player.new('moe')
# player2 = Player.new('larry', 60)
# player3 = Player.new('curly', 125)
# knuckleheads = Game.new('Knuckleheads')
# knuckleheads.add_player(player1)
# knuckleheads.add_player(player2)
# knuckleheads.add_player(player3)
# knuckleheads.play(3) {knuckleheads.total_points >= 2000}
# knuckleheads.print_stats
# knuckleheads.print_high_scores

knuckleheads = Game.new('knuckleheads')
# command-line arguments are accessible in global array ARGV
# the shift command returns the first command-line argument (the csv file name)
knuckleheads.load_players(ARGV.shift || "players.csv")

loop do
	puts "\nHow many game rounds? ('quit' to exit)"
	answer = gets.chomp.downcase	# chomp remove the newline (\n) character

	case answer
	when /^\d+$/
		knuckleheads.play(answer.to_i)
	when 'quit', 'exit'
		knuckleheads.print_stats
		knuckleheads.print_high_scores
		break
	else
		puts "Please enter a number or 'quit'"
	end
end

knuckleheads.save_high_scores



