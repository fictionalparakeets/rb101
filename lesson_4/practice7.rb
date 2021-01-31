statement = "The Flintstones Rock"

# Create a hash that expresses the frequency with which each letter occurs in this string

letters = statement.split('').map! { |letter| letter if (letter != ' ') }.compact!
hash = {}

letters.each do |letter|
  if hash.has_key?(letter)
    hash[letter] += 1
  else
    hash[letter] = 1
  end
end

p hash


# LS solution:
result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end

