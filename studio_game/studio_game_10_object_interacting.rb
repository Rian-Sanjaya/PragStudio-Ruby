class Player
	#attr_reader :name, :health
	attr_reader :health		# getter shortcut
	# attr_reader :name
	# attr_writer :name		# setter shortcut
	attr_accessor :name		#define getter and setter shortcuts
	# this is the same as define these two instanse method (getter and setter)
	# def name
	# 	@name
	# end

	# we want to capitalize the name so we write our setter method to overide the generated method by Ruby 
	def name=(new_name)
		@name = new_name.capitalize
	end

	def initialize(name, health=100)
		@name = name.capitalize
		@health = health
	end

	def score
		@health + @name.length
	end

	def to_s
		"I'm #{@name} with a health of #{@health} and a score of #{score}."
	end

	def blam
		@health -= 10
		puts "#{@name} got blammed!"
	end

	def woot
		@health += 15
		puts "#{@name} got wooted!"
	end
end

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

player1 = Player.new('moe')
player2 = Player.new('larry', 60)
player3 = Player.new('curly', 125)
knuckleheads = Game.new('Knuckleheads')
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.play

player4 = Player.new('Alvin')
player5 = Player.new('Simon', 60)
player6 = Player.new('Theodore', 125)
chipmunks = Game.new('chipmunk')
chipmunks.add_player(player4)
chipmunks.add_player(player5)
chipmunks.add_player(player6)
chipmunks.play
