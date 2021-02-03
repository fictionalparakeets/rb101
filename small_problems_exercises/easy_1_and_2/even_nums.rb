# Even Numbers
# Print all even numbers from 1 to 99 inclusive to the console with each number on a separate line.

arr = Array(1..99)
puts arr.select { |x| x.even? }