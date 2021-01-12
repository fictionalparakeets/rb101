# test

=begin
RB101 Programming Foundations > Lesson 2: Small Programs > 7. Walk-through: Calculator

Build a command line calculator program that does the following:
- asks for two numbers
- asks for the type of operation to perform: add, subtract, multiply, divide
- displays the result
=end

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i != 0
end

num1 = nil
num2 = nil
name = nil

loop do
  prompt("Let's do some calculating!")
  prompt("What's your name?")
  name = gets.chomp
  if name.empty?
    prompt("Make sure to use a valid name please.")
  else
    break
  end
end

prompt("Hello, #{name}!")

loop do # main loop
  loop do
    prompt("What's the first number?")
    num1 = gets.chomp.to_f
    if valid_number?(num1)
      break
    else
      prompt("That's not a valid number. Let's try again")
    end
  end

  loop do
    prompt("What's the second number?")
    num2 = gets.chomp.to_f
    if valid_number?(num2)
      break
    else
      prompt("That's not a valid number. Let's try again")
    end
  end

  operation = ''

  operator_prompt = <<-MSG
    What operation would you like to do?
      1. ADD
      2. SUBTRACT
      3. MULTIPLY
      4. DIVIDE
    MSG

  loop do
    prompt(operator_prompt)
    operation = gets.chomp
    if %w(1 2 3 4).include?(operation) && operation.length == 1
      break
    else
      prompt("Please choose one operation to perform")
    end
  end

  def operation_to_message(opr)
    case opr
    when "1"
      "addition"
    when "2"
      "subtraction"
    when "3"
      "multiplication"
    when "4"
      "division"
    end
  end

  puts "\n"
  prompt("Performing the requested #{operation_to_message(operation)} on the two numbers.")
  puts "\n"
  sleep(1)

  def calculate(opr, num1, num2)
    case opr
    when "1"
      num1 + num2
    when "2"
      num1 - num2
    when "3"
      num1 * num2
    when "4"
      num1 / num2
    else
      "not possile. An error has occured. Please try again"
    end
  end

  prompt("The answer is #{calculate(operation, num1, num2)}!")
  prompt("Thanks for calculating #{name}!")

  prompt("Do you want to perform another calculation #{name}? (y/n)")
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end # end main loop

prompt("Thank you. Goodbye #{name}!")
