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

player1 = Player.new('moe')
player2 = Player.new('larry', 60)
player3 = Player.new('curly', 125)
puts player1.health
puts player2.health
puts player3.health

puts player2.name 			# calling name attribute
player2.name = 'lawrence' 	# setting name attribute
puts player2.name
puts player2.health
puts player2.score
puts player2
