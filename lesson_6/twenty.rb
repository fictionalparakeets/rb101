# Lesson 6 Assignment: Twenty-One

require 'pry'

player1_hand = {}
dealers_hand = {}
SUITS = [:hearts, :diamonds, :spades, :clubs]
game_over = false
hidden_dealer_card = {}
play_again = ''

def prompt(msg) # TESTED AND WORKS
  puts "==> #{msg}"
end

def clear_display # TESTED AND WORKS
  system("clear")
end

def initialize_deck # TESTED AND WORKS
  deck = {
    hearts: [2, 3, 4, 5, 6, 7, 8, 9, "J", "Q", "K", "A"],
    diamonds: [2, 3, 4, 5, 6, 7, 8, 9, "J", "Q", "K", "A"],
    spades: [2, 3, 4, 5, 6, 7, 8, 9, "J", "Q", "K", "A"],
    clubs: [2, 3, 4, 5, 6, 7, 8, 9, "J", "Q", "K", "A"]
  }
end

def display_card(suit, cards_array)
  symbols = ['♥', '♦', '♠', '♣', ' ']
  cards_array.each do |card|
    suit_symbol = symbols[0] if suit == :hearts
    suit_symbol = symbols[1] if suit == :diamonds
    suit_symbol = symbols[2] if suit == :spades
    suit_symbol = symbols[3] if suit == :clubs
    suit_symbol = symbols[4] if suit == ' '
    puts "+-----+"
    puts "|  #{card}  |"
    puts "|     |"
    puts "|  #{suit_symbol}  |"
    puts "+-----+"
  end
end

def get_card(deck)
  random_suit = SUITS.sample
  card = [random_suit, deck[random_suit].sample]
  deck[random_suit].delete(card[1])
  deck.delete(random_suit) if deck[random_suit].empty?
  card
end

def hit!(player, deck)
  suit, card = get_card(deck)
  if player.key?(suit)
    player[suit] << card
  else
    player[suit] = [card]
  end
end

def evaluate_value_of_hand(players_hand)
  players_hand_ints = []
  players_hand = players_hand.values.flatten
  players_hand.map do |card|
    if card.class == String
      if card == "A"
        players_hand_ints.push(11)
      elsif card == " "
        players_hand_ints.push(0)
      else
        players_hand_ints.push(10)
      end
    else
      players_hand_ints.push(card)
    end
  end
  value = players_hand_ints.sum
  value = convert_ace_to_one(players_hand_ints) if value > 22 && players_hand_ints.any?(11)
  value
end

def convert_ace_to_one(hand_ints)
  loop do
    to_convert = hand_ints.index(11)
    hand_ints[to_convert] = 1
    break if hand_ints.sum < 22
    break if !hand_ints.any?(11)
  end
  hand_ints.sum
end

def display_player_hand(player)
  puts "Player 1's Hand:"
  player.each_pair { |key, value| display_card(key, value) }
  puts "Value of Player 1's Hand: #{evaluate_value_of_hand(player)}"
  puts "\n"
end

def display_dealer_hand(player, hidden_card_var, game_over_true)
  unhide_dealer_card!(player, hidden_card_var) if game_over_true
  puts "Dealer's Hand:"
  player.each_pair { |key, value| display_card(key, value) }
  puts "Displayed Value of Dealer's Hand: #{evaluate_value_of_hand(player)}"
  puts "\n"
end

def deal_hidden_card!(player, deck, hidden_card_var)
  if player.empty?
    hidden_card_var = hit!(hidden_card_var, deck)
  end
  player[' '] = [' ']
end

def unhide_dealer_card!(player, hidden_card_var)
  suit = hidden_card_var.keys[0]
  card = hidden_card_var[suit][0]
  player.delete_if { |k, v| k == ' ' }
  if player.key?(suit)
    player[suit] << card
  else
    player[suit] = [card]
  end
  hidden_card_var.delete(suit)
end

def add_5_lines_to_display
  # For display continuity. Fill space that will be occupied by second card
  puts "\n"
  puts "\n"
  puts "\n"
  puts "\n"
  puts "\n"
end

def refresh_screen(dealer, player, deck, hidden_card_var, game_over_true)
  clear_display
  display_dealer_hand(dealer, hidden_card_var, game_over_true)
  puts "\n"
  display_player_hand(player)
end

# ABOVE METHODS ARE FOR BEHIND THE SCENES WORK




# METHODS CALLED DURING GAMEPLAY
def opening_deal(dealer, player, deck, hidden_card_var)
  sleep(1)
  clear_display
  deal_hidden_card!(dealer, deck, hidden_card_var)
  display_dealer_hand(dealer, hidden_card_var, false)
  add_5_lines_to_display
  puts "\n"
  sleep(1)
  hit!(player, deck)
  display_player_hand(player)
  sleep(1)
  hit!(dealer, deck)
  clear_display
  display_dealer_hand(dealer, hidden_card_var, false)
  display_player_hand(player)
  sleep(1)
  hit!(player, deck)
  clear_display
  display_dealer_hand(dealer, hidden_card_var, false)
  display_player_hand(player)
end

def player_hit_or_stay(dealer, player, deck, hidden_card_var, game_over_true)
  loop do
    refresh_screen(dealer, player, deck, hidden_card_var, game_over_true)
    break if busted?(player)
    prompt("Would you like to hit or stay?")
    prompt("1) Hit")
    prompt("2) Stay")
    response = gets.chomp.to_s.downcase
    response = response[0]
    break if response == 's' || response == '2'
    hit!(player, deck)
  end
end

def dealer_hit_or_stay(dealer, player, deck, hidden_card_var, game_over_true)
  loop do
    break if evaluate_value_of_hand(dealer) > 16 || busted?(dealer)
    sleep(1)
    hit!(dealer, deck)
    refresh_screen(dealer, player, deck, hidden_card_var, game_over_true)
  end
end

def busted?(player) # TESTED AND WORKS
  evaluate_value_of_hand(player) > 21
end

def output_winner!(dealer, player)
  if busted?(dealer) && !busted?(player)
    prompt("Player 1 has won this round.")
  elsif busted?(player)
    prompt("The Dealer has won this round.")
  elsif evaluate_value_of_hand(dealer) >= evaluate_value_of_hand(player)
    prompt("The Dealer has won this round.")
  else
    prompt("Player 1 has won this round.")
  end
end

def play_again?
  answer = ''
  loop do
    prompt("Do you want to play again? (y/n)")
    answer = gets.chomp.downcase
    break if answer == "y" || answer == "n"
    prompt("Invalid entry. Try again please.")
  end
  return false if answer == 'n'
  return true if answer == 'y'
end



# MAIN GAME LOOP STARTS NOW


# Make this a multiplayer game by passing in an array of players instead of individual players?

loop do
  game_deck = initialize_deck
  opening_deal(dealers_hand, player1_hand, game_deck, hidden_dealer_card)
  player_hit_or_stay(dealers_hand, player1_hand, game_deck, hidden_dealer_card, game_over)
  output_winner!(dealers_hand, player1_hand)
  dealer_hit_or_stay(dealers_hand, player1_hand, game_deck, hidden_dealer_card, game_over)
  output_winner!(dealers_hand, player1_hand)
  break if play_again? != true
  player1_hand = {}
  dealers_hand = {}
  hidden_dealer_card = {}
end


