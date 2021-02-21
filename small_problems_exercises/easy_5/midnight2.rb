# After Midnight (Part 2)

=begin
As seen in the previous exercise, the time of day can be represented as the number of minutes before
or after midnight. If the number of minutes is positive, the time is after midnight.
If the number of minutes is negative, the time is before midnight.

Write two methods that each take a time of day in 24 hour format, and return the number of
minutes before and after midnight, respectively. Both methods should
return a value in the range 0..1439.

You may not use ruby's Date and Time methods.
=end

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def string_to_parts(input)
  hours = input[0, 2]
  minutes = input[3, 2]
  [hours.to_i, minutes.to_i]
end
  

def before_midnight(input)
  hours, minutes = string_to_parts(input)
  return 0 if hours == MINUTES_PER_DAY * hours
  MINUTES_PER_DAY - ((MINUTES_PER_HOUR * hours) + minutes)
end


def after_midnight(input)
  hours, minutes = string_to_parts(input)

  ((MINUTES_PER_HOUR * hours) + minutes) % MINUTES_PER_DAY
end

=begin
 Solution from exercise:
  
HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def after_midnight(time_str)
  hours, minutes = time_str.split(':').map(&:to_i)
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnight(time_str)
  delta_minutes = MINUTES_PER_DAY - after_midnight(time_str)
  delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
  delta_minutes
end

=end



# Tests:
p after_midnight('00:00')  == 0
p before_midnight('00:00') == 0
p after_midnight('12:34')  == 754
p before_midnight('12:34') == 686
p after_midnight('24:00')  == 0
p before_midnight('24:00') == 0

