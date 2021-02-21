# ddaaiillyy ddoouubbllee

=begin
Write a method that takes a string argument and returns a new string that contains
the value of the original string with all consecutive duplicate characters collapsed
into a single character. You may not use String#squeeze or String#squeeze!.
=end

def crunch(input)
  array = input.split('')
  new_array = []
  array.map do |letter|
    if new_array[-1] == letter
      next
    else
      new_array << letter
    end
  end
  new_array.join('')
end

# Tests:
p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
