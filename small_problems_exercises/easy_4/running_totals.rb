# Running Totals

# Write a method that takes an array of numbers, and returns an array with the same number of elements,
# and each element has the running total from the original aray.

def running_total(arr)
  total = 0
  arr.map { |i| total += i }
end

# Tests:
p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
