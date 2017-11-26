module StudioGame
	module Playable
		def blam
			# when assigning a value to an attribute (health), we must use self. otherwise Ruby will treat health as a local variable
			self.health -= 10
			# when read the value of an attribute (name), using self is optional, because self is always the implicit (default) receiver of a method call
			puts "#{name} got blammed!"
		end

		def woot
			self.health += 15
			puts "#{name} got wooted!"
		end

		def strong? 
			health > 100
		end
	end
end