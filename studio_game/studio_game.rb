require_relative 'game'

# 1. create 3 player objects
# 2. create a game (object)
# 3. add the players to the game
# 4. play the game
#    a. print the number of player and game title
#    b. print (introduce) each player name with their health and score
#    c. each player get a turn to roll a die (result in random number), and base on the resulting number their's health is increased (woot), remained (skiped), or decreased (blam)

player1 = Player.new('moe')
player2 = Player.new('larry', 60)
player3 = Player.new('curly', 125)
knuckleheads = Game.new('Knuckleheads')
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.play(3)
knuckleheads.print_stats
knuckleheads.print_high_scores

player4 = Player.new('Alvin')
player5 = Player.new('Simon', 60)
player6 = Player.new('Theodore', 125)
chipmunks = Game.new('chipmunk')
chipmunks.add_player(player4)
chipmunks.add_player(player5)
chipmunks.add_player(player6)
chipmunks.play(3)
chipmunks.print_stats
chipmunks.print_high_scores

