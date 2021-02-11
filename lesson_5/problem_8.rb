# Practice problem 8
# Using the each method write some code to output all the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |_, array|
  array.each do |word|
    word.each_char do |letter|
      puts letter if letter.match?(/[aeiou]/i)
    end
  end
end
