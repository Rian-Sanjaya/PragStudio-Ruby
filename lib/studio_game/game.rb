require_relative 'player'
require_relative 'game_turn'
require_relative 'treasure_trove'
require 'csv'

module StudioGame
	class Game
		attr_reader :title, :players

		def initialize(title)
			@title = title
			@players = []
		end

		def add_player(player)
			@players.push(player)
		end

		def total_points
			@players.reduce(0) { |sum, player| sum + player.points }
		end

		def print_name_and_health(players)
			players.each {|player| puts "#{player.name} (#{player.health})"}
		end

		def print_stats
			# strong_players = @players.select {|player| player.strong?}
			# wimpy_players = @players.select {|player| player.strong?}
			strong_players, wimpy_players = @players.partition {|player| player.strong?}
			puts "\n#{@title} Statistics: "
			puts "\n#{strong_players.size} strong players: "
			print_name_and_health(strong_players)
			puts "\n#{wimpy_players.size} wimpy players: "
			print_name_and_health(wimpy_players)

			@players.each do |player|
				puts "\n#{player.name}'s point totals:"
				player.each_found_treasure do |treasure|
					puts "#{treasure.points} total #{treasure.name} points"
				end
				puts "#{player.points} grand total points"
			end

			puts "\n#{total_points} total point from treasures found"
		end

		def high_score_entry(player)
			formatted_name = player.name.ljust(20, '.')
			"#{formatted_name} #{player.score}"
		end

		def print_high_scores
			puts "\n#{@title} Hight Scores: "
			sorted_players = @players.sort {|a, b| b.score <=> a.score}
			sorted_players.each do |player| 
				puts high_score_entry(player)
			end
		end

		def save_high_scores(to_file="high_scores.txt")
			File.open(to_file, "w") do |file|
				file.puts "#{@title} High Scores:"
				sorted_players = @players.sort {|a, b| b.score <=> a.score}
				sorted_players.each do |player|
					file.puts high_score_entry(player)
				end
			end
		end

		def load_players(from_file)
			# File.readlines(from_file).each do |line|
			# 	add_player(Player.from_csv(line))
			# end
			CSV.foreach(from_file) do |row|
				player = StudioGame::Player.new(row[0], row[1].to_i)
				add_player(player)
			end
		end

		def play(rounds)
			treasures = StudioGame::TreasureTrove::TREASURES
			puts "\nThere are #{treasures.size} treasures to be found:"
			treasures.each  do |treasure| 
				puts "A #{treasure.name} is worth #{treasure.points} points"
			end

			puts "\nThere are #{@players.size} players in #{title}:"
			@players.each do |player|
				puts player
			end

			1.upto(rounds) do |count|
				# if a block is provided when calling the play method 
				# and if the yield (the block) return true stop (break) the loop, otherwise continue
				if block_given?
					break if yield
				end

				puts "\nGame round #{count}: "

				@players.each do |player|
					StudioGame::GameTurn.take_turn(player)
					puts player
				end
			end
		end
	end
end