# When will I retire?
=begin
Build a program that displays when the user will retire and how many years she has to work till retirement.

Example:
What is your age? 30
At what age would you like to retire? 70

It's 2016. You will retire in 2056.
You have only 40 years of work to go!
=end

current_year = Time.now.year
puts "What is your age?"
age = gets.chomp.to_i
puts "What age would you like to retire?"
retirement_age = gets.chomp.to_i
remaining_work = retirement_age - age
puts "It's #{current_year}. You will retire in #{current_year + remaining_work}."
puts "You only have #{remaining_work} years of work to go!"
