#!/usr/bin/env ruby

class MegaGreeter

	# can't access instance variables without defining accessor
	attr_accessor :names


	# constructor
	def initialize(names = "World")
		@names = names
	end


	def say_hi
		if @names.nil?
			puts "..."
		# if the names instance variable responds to the each method its an iterable
		# DUCK TYPING - not caring about the actual type of a variable, just relying on what methods it supports (if it walks like a duck and quacks like a duck its a duck)
		elsif @names.respond_to?("each")
			# iterate over the names list
			# for every element of the list name is bound to it
			@names.each do |name|
				puts "Hello #{name}"
			end
		else
			puts "Hello #{@names}"
		end
	end


	def say_bye	
		if @names.nil?
			puts "..."
		# if the names instance variable responds to the join method use it
		elsif @names.respond_to?("join")
			puts "Goodbye #{@names.join(", ")}. Come back soon"
		else
			puts "Goodbye #{@names}. Come back soon"
		end
	end

end


# $0 is the name of the file used to start the program
# __FILE__ contains the name of the current file
# equivilant to python __name__ == "__main__"
if __FILE__ == $0
	mg = MegaGreeter.new
	mg.say_hi
	mg.say_bye

	mg.names = "David"
	mg.say_hi
	mg.say_bye

	mg.names = ["David", "Frank", "Phil", "Neil", "Luke"]
	mg.say_hi
	mg.say_bye

	mg.names = nil
	mg.say_hi
	mg.say_bye
end

