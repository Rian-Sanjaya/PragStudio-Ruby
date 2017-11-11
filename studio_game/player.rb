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

# if we want run example codes in this (class) file, but we don't want it to run when running the entire program
# __FILE__ is a variable that hold the file name of this file (the currently source file), that is 'player.rb'
# $0 or $PROGRAM_NAME is a variable that hold the currently running file, that is 'player.rb'
if __FILE__ == $0
	player = Player.new("moe")
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
