require_relative 'player'

class Game
	attr_reader :title, :players

	def initialize(title)
		@title = title
		@players = []
	end

	def add_player(player)
		@players.push(player)
	end

	def play
		puts "There are #{@players.size} players in #{title}:"
		@players.each do |player|
			puts player
			player.blam
			player.woot
			player.woot
			puts player
		end
	end
end
