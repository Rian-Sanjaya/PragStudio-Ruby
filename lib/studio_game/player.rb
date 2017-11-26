require_relative 'treasure_trove'
require_relative 'playable'

module StudioGame
	class Player
		include StudioGame::Playable

		# attr_reader :health		# getter shortcut
		# attr_reader :name
		# attr_writer :name		# setter shortcut
		attr_accessor :name, :health		#define getter and setter shortcuts
		# this is the same as define these two instanse method (getter and setter)
		# def name
		# 	@name
		# end

		# if we want to change (set) the name outside of this class (the instance variable name can be change after the initialize)
		# we want to capitalize the name so we write our setter method to overide the generated method by Ruby 
		def name=(new_name)
			@name = new_name.capitalize
		end

		def initialize(name, health=100)
			@name = name.capitalize
			@health = health
			@found_treasures = Hash.new(0)
		end

		def score
			@health + points
		end

		def to_s
			"I'm #{@name} with health = #{@health}, points = #{points} and score = #{score}."
		end

		def found_treasure(treasure)
			@found_treasures[treasure.name] += treasure.points
			puts "#{@name} found a #{treasure.name} worth #{treasure.points} points"
			puts "#{@name} treasures: #{@found_treasures}"
		end

		def points
			@found_treasures.values.reduce(0, :+)
		end

		def each_found_treasure
			@found_treasures.each do |name, points|
				yield StudioGame::Treasure.new(name, points)
			end
		end

		def self.from_csv(string)
			name, health = string.split(',')
			Player.new(name, Integer(health))
		end
	end
end

# if we want run example codes in this (class) file, but we don't want it to run when running the entire program
# __FILE__ is a variable that hold the file name of this file (the currently source file), that is 'player.rb'
# $0 or $PROGRAM_NAME is a variable that hold the currently running file, that is 'player.rb'
if __FILE__ == $0
	player = StudioGame::Player.new("moe")
	puts player.name
	puts player.health
	player.woot
	puts player.health
	player.blam
	puts player.health

	puts player.name 			# calling name attribute
	player.name = 'lawrence' 	# setting name attribute
	puts player.name
	puts player.health
	puts player.score
	puts player
end
