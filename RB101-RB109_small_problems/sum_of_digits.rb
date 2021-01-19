# Write a method that takes one argumen, a positive integer, and returns the sum of its digits

def sum(num)
  num.to_s.split('').map(&:to_i).inject(:+)
end


puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

