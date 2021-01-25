# Walk-through: Rock Paper Scissors

require 'pry'

# Variables / arrays / hashs defined
VALID_CHOICES = ['rock', 'paper', 'scissors']
VALID_GAMES = [1, 2]
score_hash = {
  player_score: 0,
  computer_score: 0,
  tie_score: 0
}
match_or_single_game = 0
match_message = "The match will end when one player wins 5 games. Good luck!"
intro_msg = <<-MSG
Welcome to #{VALID_CHOICES}!
  Do you want to play a single game or a match?
      1) Single Game
      2) Match
MSG

# Methods defined
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

def clear_scores(hsh)
  hsh.transform_values! { |value| value = 0 }
end

def output_match_winner(winner)
  prompt("#{winner} won the match!")
end

def display_scores(hsh)
  puts "***********************************************************"
  hsh.each { |k, v| puts "#{k}: #{v}"}
  puts "***********************************************************"
end

# Program Begins
puts intro_msg

loop do
  match_or_single_game = gets.chomp.to_i
  break if VALID_GAMES.include?(match_or_single_game)
  prompt("That doesn't look like a valid entry. Try again!")
end

prompt(match_message) if match_or_single_game == 2

loop do
  clear_scores(score_hash)
  loop do
    player_choice = ''
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      player_choice = gets.chomp.downcase
      break if VALID_CHOICES.include?(player_choice)
      prompt("That's not a valid choice.")
    end

    computer_choice = VALID_CHOICES.sample
    prompt("You chose: #{player_choice}. Computer chose: #{computer_choice}.")
    display_results(player_choice, computer_choice)
    puts "_____________________________________________"

    break if match_or_single_game == 1

    if win?(computer_choice, player_choice)
      score_hash[:computer_score] += 1
    end
    if win?(player_choice, computer_choice)
      score_hash[:player_score] += 1
    end
    if player_choice == computer_choice
      score_hash[:tie_score] += 1
    end

    if score_hash[:player_score] == 5
      output_match_winner("You")
      display_scores(score_hash)
      break
    elsif score_hash[:computer_score] == 5
      output_match_winner("Computer")
      display_scores(score_hash)
      break
    end
  end

  prompt("Do you want to play again? y/n")
  play_again = gets.chomp.downcase
  break if play_again != 'y'
end

prompt("Thanks for playing. Goodbye!")
