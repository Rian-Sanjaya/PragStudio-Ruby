require_relative 'player'
require_relative 'game_turn'

class Game
	attr_reader :title, :players

	def initialize(title)
		@title = title
		@players = []
	end

	def add_player(player)
		@players.push(player)
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
	end

	def print_high_scores
		sorted_players = @players.sort {|a, b| b.score <=> a.score}
		puts "\n#{@title} Hight Scores: "
		sorted_players.each {|player| puts "#{player.name.ljust(20, '.')} #{player.score}"}
	end

	def play(rounds)
		puts "\nThere are #{@players.size} players in #{title}:"
		@players.each do |player|
			puts player
		end

		1.upto(rounds) do |count|
			puts "\nGame round #{count}: "

			@players.each do |player|
				GameTurn.take_turn(player)
				puts player
			end
		end
	end
end
