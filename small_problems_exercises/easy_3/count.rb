# Counting the Number of Characters
=begin
Write a program that will ask a user for an input of a word or multiple words and 
give back the number of characters. Spaces should not be counted as a character.

input:
Please write word or multiple words: walk

output:
There are 4 characters in "walk".

input:
Please write word or multiple words: walk, don't run

output:
There are 13 characters in "walk, don't run".
=end

def prompt(message)
  puts "==> #{message}"
end

prompt("Enter a word, phrase, or sentence and I'll count the characters for you.")
input = gets.chomp

characters = input.split.join
num_of_chars = characters.chars.count

puts "There are #{num_of_chars} characters in \"#{input}\"."

