# Walk-through: Rock Paper Scissors
VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'paper' && second == 'rock')
end

def display_results(player, computer)
  if win?(computer, player)
    prompt("Computer wins!")
  elsif player == computer
    prompt("It's a tie!")
  else
    prompt("You win!")
  end
end

loop do # main loop
  player_choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    player_choice = gets.chomp.downcase
    break if VALID_CHOICES.include?(player_choice)
    prompt("That's not a valid choice.")
  end

  computer_choice = VALID_CHOICES.sample
  sleep(1)
  prompt("You chose: #{player_choice}. Computer chose: #{computer_choice}.")
  sleep(1)
  display_results(player_choice, computer_choice)

  prompt("Do you want to play again? y/n")
  play_again = gets.chomp.downcase
  break if play_again != 'y'
end

prompt("Thanks for playing. Goodbye!")
