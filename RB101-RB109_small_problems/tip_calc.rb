# Tip calculator
=begin
Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. 
The program must compute the tip and then display both the tip and the total amount of the bill.

Example:
What is the bill? 200
What is the tip percentage? 15

The tip is $30.0
The total is $230.0
=end

puts "What is the bill?"
bill_total = gets.to_f
puts "What is the tip percentage?"
tip_percent = gets.to_f
tip_amt = (tip_percent / 100 * bill_total)
total_payable = (tip_amt + bill_total)
puts "The tip is $%0.2f" % [tip_amt]
puts "The total is $%0.2f" % [total_payable]
