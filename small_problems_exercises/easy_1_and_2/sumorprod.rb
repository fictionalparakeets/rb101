# Sum or product of consecutive integers
=begin
Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to 
determine the sum or product of all numbers between 1 and the entered integer.

Examples:
>> Please enter an integer greater than 0:
5
>> Enter 's' to compute the sum, 'p' to compute the product.
s
The sum of the integers between 1 and 5 is 15.


>> Please enter an integer greater than 0:
6
>> Enter 's' to compute the sum, 'p' to compute the product.
p
The product of the integers between 1 and 6 is 720.
=end

int = 0
loop do
  puts "Please enter an integer greater than 0."
  int = gets.to_i
  break if int > 0
  puts "Try again! That number isn't higher than 0."
end

operation = ''
loop do
  puts "Enter 's' to compute the sum, 'p' to compute the product."
  operation = gets.chomp.downcase
  break if operation == 's' || operation == 'p'
  puts "Invalid entry. Try again."
end

sum = Array(1..int).inject(:+)
product = Array(1..int).inject(:*)

if operation == 's'
  puts "The sum of the integers between 1 and #{int} is #{sum}."
elsif operation == 'p'
  puts "The product of the integers between 1 and #{int} is #{product}."
else
  puts "Error."
end
