# Bannerizer

=begin
Write a method that will take a short line of text, and print it within a box.

print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+
=end



def sub_char(input, char)
  input.gsub(/./, char)
end


def print_in_box(input)
  puts "+-#{sub_char(input, "-")}-+"
  puts "| #{sub_char(input, " ")} |"
  puts "| #{input} |"
  puts "| #{sub_char(input, " ")} |"
  puts "+-#{sub_char(input, "-")}-+"
end




# Tests:
print_in_box('')


puts "                              "
puts "******************************"
puts "                              "


print_in_box('Testing this out. How does this work?')


=begin
Solution from LS:
def print_in_box(message)
  horizontal_rule = "+#{'-' * (message.size + 2)}+"
  empty_line = "|#{' ' * (message.size + 2)}|"

  puts horizontal_rule
  puts empty_line
  puts "| #{message} |"
  puts empty_line
  puts horizontal_rule
end
=end
