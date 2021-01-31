flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# in the array find the index of the first name that starts with "Be"

name_index = flintstones.index { |name| name.start_with?("Be") }
p name_index

# Solution from LS
flintstones.index { |name| name[0, 2] == "Be" }

