# Given the Munsters hash below:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
=begin
Modify the hash such that each member of the Munster family has an additional "age_group" key that has 
one of three values describing the age group the family member is in (kid, adult, or senior). 
Your solution should produce the hash below

{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

  Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.
=end

munsters.each do |name, _|
  if munsters[name]["age"] <= 17
    munsters[name].store("age_group", "kid")
  elsif munsters[name]["age"] <= 64
    munsters[name].store("age_group", "adult")
  else
    munsters[name].store("age_group", "senior")
  end
end

=begin
# Alternative with case statement
munsters.map do |name, nestedhash|
  case nestedhash["age"]
  when 0..18
    nestedhash.store("age_group", "kid")
  when 19..65
    nestedhash.store("age_group", "adult")
  else
    nestedhash.store("age_group", "senior")
  end
end
=end

munsters.each { |k, v| puts "#{k} : #{v}" }
