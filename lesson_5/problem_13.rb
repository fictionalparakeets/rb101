# Practice problem 13

# Given the following data structure, return a new array containing the same sub-arrays as the 
# original but ordered logically by only taking into consideration the odd numbers they contain.

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

# sorted array should look like this: [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

new_array = arr.sort_by do |array|
  array.select do |num|
    num.odd?
  end
end


p arr
p new_array
