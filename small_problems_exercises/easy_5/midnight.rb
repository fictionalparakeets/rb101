# After Midnight (Part 1)

=begin
The time of day can be represented as the number of minutes before or after midnight.
If the number of minutes is positive, the time is after midnight.
If the number of minutes is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and returns the time
of day in 24 hour format (hh:mm). Your method should work with any integer input.

You may not use ruby's Date and Time classes.
Disregard Daylight Savings and Standard Time and other complications.
=end

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

=begin
def add_zero!(hourormin)
  if hourormin < 10
    hourormin = "0" + hourormin.to_s
  else
    hourormin = hourormin.to_s
  end
end


def bigger_than_one_day(input)
  loop do
    break if input < MINUTES_PER_DAY
    input = input - MINUTES_PER_DAY
  end
  input
end

def less_than_zero?(input)
  loop do
    break if input > 0
    input = MINUTES_PER_DAY + input
  end
  input
end

def time_of_day(input)
  input = less_than_zero?(input)
  input = bigger_than_one_day(input)
  minutes = (input % MINUTES_PER_HOUR)
  hours = (input - minutes) / MINUTES_PER_HOUR
  add_zero!(hours) + ":" + add_zero!(minutes)
end
=end

# A MUCH BETTER WAY:

def time_of_day(input)
  delta_minutes = input % MINUTES_PER_DAY
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format("%02d:%02d", hours, minutes)
end

# Tests:
p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
