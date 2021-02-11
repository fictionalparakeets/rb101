# Practice problem 6
=begin
One of the most frequently used real-world string properties is that of "string substitution",
where we take a hard-coded string and modify it with various parameters from our program.

Given this previously seen family hash, print out the name, age and gender of each family member like this:
(Name) is a (age)-year-old (male or female).
=end

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.keys.each do |member|
  puts "#{member} is a #{munsters[member]["age"]}-year-old #{munsters[member]["gender"]}."
end

=begin
Better solution (answer from exercise)

munsters.each_pair do |name, details|
  puts "#{name} is a #{details['age']} year old #{details['gender']}"
end

=end

