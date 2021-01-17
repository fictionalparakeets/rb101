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
  num.to_i != 0
end

def high_enough?(num, lowlimit)
  num >= lowlimit
end

def low_enough?(num, highlimit)
  num <= highlimit
end

puts welcome_message

loop do # main loop
  min_amrt_yrs = 5
  max_amrt_yrs = 25
  amrt_err_msg = <<-MSG
  That doesn't look like a valid length of time for the mortgage.
  Please enter the number of years the mortgage will last.
  MSG

  min_loan = 10000
  max_loan = 100000000
  loan_amt_err = "That doesn't look like a valid loan amount."

  min_apr = 0.01
  max_apr = 60.00
  apr_err_msg = "Please enter a percentage with maximum two decimal places."

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
             high_enough?(loan_amount, min_loan) &&
             low_enough?(loan_amount, max_loan)
    if num_check(loan_amount) == false
      puts "#{loan_amt_err} Please enter a valid number."
    elsif loan_amount < min_loan
      puts "#{loan_amt_err} It's too low."
    elsif loan_amount > max_loan
      puts "#{loan_amt_err} It's too high."
    end
  end

  ann_int_rate = 0
  loop do
    loop do
      prompt("What's the annual interest rate?")
      ann_int_rate = gets.chomp.to_f
      if ann_int_rate.include?("%")
        ann_int_rate = ann_int_rate.delete("%")
      end
      puts "You've entered a rate of #{ann_int_rate.to_f.round(2)}%"
      prompt("Type 'yes' if this is correct, 'no' to change it.")
      answer = gets.chomp.downcase
      break if answer == "yes"
    end
    break if high_enough?(ann_int_rate, min_apr) &&
             low_enough?(ann_int_rate, max_apr)
    puts "That rate looks too low. \n#{apr_err_msg}" if ann_int_rate < min_apr
    puts "That rate looks too high. \n#{apr_err_msg}" if ann_int_rate > max_apr
  end

  loan_yrs = 0
  loop do
    prompt("How many years do you need the mortgage for?")
    loan_yrs = gets.chomp.to_i
    break if num_check(loan_yrs) &&
             high_enough?(loan_yrs, min_amrt_yrs) &&
             low_enough?(loan_yrs, max_amrt_yrs)
    if num_check(loan_yrs) == false
      puts amrt_err_msg
    elsif loan_yrs < min_amrt_yrs
      puts "#{amrt_err_msg} Your entry was too low."
    elsif loan_yrs > max_amrt_yrs
      puts "#{amrt_err_msg} Your entry was too high."
    end
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
