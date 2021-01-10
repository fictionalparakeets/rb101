
=begin
RB101 Programming Foundations > Lesson 2: Small Programs > 7. Walk-through: Calculator

Build a command line calculator program that does the following:
- asks for two numbers
- asks for the type of operation to perform: add, subtract, multiply, divide
- displays the result
=end

puts "Let's do some calculating!"
puts "What's the first number?"
num1 = gets.chomp.to_f
puts "What's the second number?"
num2 = gets.chomp.to_f
puts "What calculation would you like to do? ( + or - or * or / )"
operation = gets.chomp

def calculate(opr, num1, num2)
  case opr
  when "+"
    num1 + num2
  when "-"
    num1 - num2
  when "*"
    num1 * num2
  when "/"
    num1 / num2
  else
    "not possile. An error has occured. Please try again"
  end
end

puts "The answer is #{calculate(operation, num1, num2)}!"




