# Searching 101
=begin
Write a program that solicits 6 numbers from the user, then prints a message
that describes whether or not the 6th number appears amongst the first 5 numbers

Examples:
==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
17
The number 17 appears in [25, 15, 20, 17, 23].
=end

def prompt(message)
  puts "==> #{message}"
end

array_to_search = []
array_of_prompt_words = ["1st", "2nd", "3rd", "4th", "5th", "last"]
counter = 0

6.times do
  prompt("Please enter the #{array_of_prompt_words[counter]} number")
  array_to_search << gets.chomp.to_i
  counter += 1
end

puts "Thank you. Searching..."
sleep(1)

number_to_search = array_to_search.pop

if array_to_search.include?(number_to_search)
  puts "The number #{number_to_search} appears in #{array_to_search}"
else
  puts "The number #{number_to_search} does not appear in #{array_to_search}"
end
