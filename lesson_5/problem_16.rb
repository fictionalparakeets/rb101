# Practice problem 16
=begin
A UUID is a type of identifier often used as a way to uniquely identify items...which may
not all be created by the same system. That is, without any form of synchronization,
two or more separate computer systems can create new items and label them with a
UUID with no significant chance of stepping on each other's toes.

It accomplishes this feat through massive randomization. The number of possible
UUID values is approximately 3.4 X 10E38.

Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections
like this 8-4-4-4-12 and represented as a string.

It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

Write a method that returns one UUID when called with no parameters.
=end

def generate_uuid
  hyphen_array = [8, 13, 18, 23]
  working_array = []
  36.times do
    working_array << rand(16)
  end
  final_array = working_array.each_with_index.map do |int, i|
    hyphen_array.include?(i) ? "-" : int.to_s(16)
  end
  final_array.join('')
end

5.times do
  puts generate_uuid
end
