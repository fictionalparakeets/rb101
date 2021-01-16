# Lesson 2: Small Programs > 16. Assignment: Mortgage/Car Loan Calculator
=begin
  Take everything you've learned so far and build a mortgage calculator.
  You'll need three pieces of information:
    - the loan amount
    - the annual percentage rate (APR)
    - the loan duration

  From the above you'll need to calculate the following things:
    - monthly interest rate
    - loan duration in months
    - monthly payment

    Formula:
    # m = p * (j / (1 - (1 + j)**(-n)))

    m = monthly payment
    p = loan amount
    j = monthly interest rate
    n = loan duration in months

  When you write the program don't use single letter variables. Be explicit.
  Don't forget to run through Rubocop.
=end

require "pry"

welcome_message = <<-MSG

    Let's buy a house! I'll help!
    First let's start by gathering all the info that we need.
    I've got a few questions for you:

MSG
outro_message = "Now go and buy that house. Goodbye!"

def prompt(message)
  puts "=> #{message}"
end

def num_check(num)
  if num != 0
    true
  else
    prompt(errormessage)
    false
  end
end

def within_limits(num, lowlimit, highlimit, errormessage)
  if num > highlimit
    prompt(errormessage)
    prompt("Double check your entry please. It looks like it's too high!")
  elsif num < lowlimit
    prompt(errormessage)
    prompt("Double check your entry please. It looks like it's too low!")
  else
    true
  end
end

puts welcome_message

loop do # main loop
  min_amrt_yrs = 1
  max_amrt_yrs = 25
  amrt_err_msg = <<-MSG
  That doesn't look like a valid length of time for the mortgage.
  Please enter the number of years the mortgage will last.
  MSG

  min_loan = 10000
  max_loan = 100000000
  loan_amt_err = "That doesn't look like a valid loan amount."

  min_apr = 0
  max_apr = 60
  apr_err_msg = <<-MSG
  That doesn't look like a valid APR. Please enter an APR
  with a maximum of two decimal places.
  MSG

  loan_amount = nil
  loop do
    prompt("How much are you borrowing?")
    # Add an error correction for this input to remove any ','
    loan_amount = gets.chomp
    if loan_amount.include?(",")
      loan_amount = loan_amount.delete(",")
    end
    loan_amount = loan_amount.to_i
    break if num_check(loan_amount) &&
             within_limits(loan_amount, min_loan, max_loan, loan_amt_err)
  end

  ann_int_rate = 0
  loop do
    loop do
      prompt("What's the annual interest rate?")
      ann_int_rate = gets.chomp
      if ann_int_rate.include?("%")
        ann_int_rate = ann_int_rate.delete("%")
      end
      puts "You've entered a rate of #{ann_int_rate.to_f.round(2)}%"
      prompt("Type 'yes' if this is correct, 'no' to change it.")
      answer = gets.chomp.downcase
      break if answer == "yes"
    end
    break if num_check(ann_int_rate.to_i) &&
             within_limits(ann_int_rate.to_i, min_apr, max_apr, apr_err_msg)
  end

  loan_yrs = 0
  loop do
    prompt("How many years do you need the mortgage for?")
    loan_yrs = gets.chomp.to_i
    break if num_check(loan_yrs) &&
             within_limits(loan_yrs, min_amrt_yrs, max_amrt_yrs, amrt_err_msg)
  end

  mnth_int_rate_decimal = ann_int_rate.to_f / 12 / 100
  loan_months = loan_yrs * 12

  monthly_payment = loan_amount * (mnth_int_rate_decimal / (1 -
    (1 + mnth_int_rate_decimal)**(-loan_months)))
  monthly_payment = monthly_payment.round(2)

  puts <<-MSG

  Based on the data you've provided your monthly payment will be $#{monthly_payment}

  MSG

  prompt("Would you like to re-calculate? (yes/no)")
  recalc = gets.chomp.downcase

  break if recalc != "yes"
end

puts outro_message
