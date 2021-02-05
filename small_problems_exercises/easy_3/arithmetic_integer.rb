# Arithmetic Integer
=begin
Write a program that prompts the user for two positive integers, and then prints 
the results of the following operations on those two numbers: addition, subtraction, 
product, quotient, remainder, and power. Do not worry about validating the input.

Example:
==> Enter the first number:
23
==> Enter the second number:
17
==> 23 + 17 = 40
==> 23 - 17 = 6
==> 23 * 17 = 391
==> 23 / 17 = 1
==> 23 % 17 = 6
==> 23 ** 17 = 141050039560662968926103
=end

def prompt(message)
  puts "==> #{message}"
end

prompt("Enter the first number:")
first_num = gets.chomp.to_i
prompt("Enter the second number:")
second_num = gets.chomp.to_i

prompt("#{first_num} + #{second_num} = #{first_num + second_num}")
prompt("#{first_num} - #{second_num} = #{first_num - second_num}")
prompt("#{first_num} * #{second_num} = #{first_num * second_num}")
prompt("#{first_num} / #{second_num} = #{first_num / second_num}")
prompt("#{first_num} % #{second_num} = #{first_num % second_num}")
prompt("#{first_num} ** #{second_num} = #{first_num ** second_num}")
