# Write a method that counts the number of occurrences of each element in a given array.

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]


# The words in the array are case-sensitive: 'suv' != 'SUV'. ` Once counted, print each element alongside the number of occurrences.

=begin
Expected output:
car => 4
truck => 3
SUV => 1
motorcycle => 2
=end

# my solution
def count_occurrences(array)
  count = Hash.new
  counter = 0
  array.each { |i| 
    if count[i] == nil
      count[i] = 1
    else
      count[i] = count[i] += 1
    end
    counter += 1
  }
  count.each_pair { |k, v| puts "#{k} => #{v}"}
end

count_occurrences(vehicles)


# solution listed in exercise
def count_occurrences(array)
  occurrences = {}

  array.uniq.each do |element|
    occurrences[element] = array.count(element)
  end

  occurrences.each do |element, count|
    puts "#{element} => #{count}"
  end
end
