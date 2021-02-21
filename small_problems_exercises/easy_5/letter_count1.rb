# Letter Counter (Part 1)

=begin
Write a method that takes a string with one or more space separated words and
returns a hash that shows the number of words of different sizes.

Words consist of any string of characters that do not include a space.
=end

def word_sizes(input)
  hash = {}
  input .split.each do |word|
    num_of_letters = word.chars.count
    if hash.has_key?(num_of_letters)
      hash[num_of_letters] += 1
    else
      hash[num_of_letters] = 1
    end
  end
  hash
end

=begin
  Better method:

def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    counts[word.size] += 1
  end
  counts
end

Notes:
If we initialize counts as
counts = {}
we will get an exception the first time counts[word.size] += 1 is executed.
This is because that element doesn't exist, so counts[word.size] returns nil,
and nil cannot be added to 1. To fix this, we use the default value form of initializing counts:
counts = Hash.new(0)
This forces any references to non-existing keys in counts to return 0.

=end

# Tests:
p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}
