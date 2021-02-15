INITIAL_MARK = ' '
PLAYER_MARK = 'X'
COMPUTER_MARK = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7]] +
                [[2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
player_score = 0
computer_score = 0
match_counter = 0

# rubocop:disable Metrics/AbcSize
def display_board(hash, game_count, game_length)
  system 'clear'
  puts "Time for round #{game_count}" if game_length == 2
  puts "                 "
  puts "     |     |     "
  puts "  #{hash[1]}  |  #{hash[2]}  |  #{hash[3]}  "
  puts "_____|_____|_____"
  puts "     |     |     "
  puts "  #{hash[4]}  |  #{hash[5]}  |  #{hash[6]}  "
  puts "_____|_____|_____"
  puts "     |     |     "
  puts "  #{hash[7]}  |  #{hash[8]}  |  #{hash[9]}  "
  puts "     |     |     "
  puts "                 "
  puts "*****************"
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  board_values = {}
  (1..9).each { |num| board_values[num] = INITIAL_MARK }
  board_values
end

def prompt(msg)
  puts "==> #{msg}"
end

def who_goes_first?
  prompt("Choose who makes the first move." \
    "\n     1) You" \
    "\n     2) Computer" \
    "\n     3) Random")
  first_movers = %w(You Computer)
  who_first = gets.chomp.to_i
  who_first = Array(1..2).sample if who_first == 3
  first_movers[who_first - 1]
end

def player_turn!(brd)
  player_move = 0
  prompt("Mark an X by choosing a number: #{possible_moves_string(brd)}")
  loop do
    player_move = gets.chomp.to_i
    break if possible_moves?(brd).include?(player_move)
    if player_move >= 10 || player_move < 1
      prompt("Invalid selection.")
    else
      prompt("The move is already taken. Please enter a different move.")
    end
    prompt("Here are your possible moves: #{possible_moves_string(brd)}")
  end
  brd[player_move] = PLAYER_MARK
end

def computer_turn!(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARK)
    break if square
  end
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARK)
      break if square
    end
  end
  if !square
    square = 5 if brd[5] == INITIAL_MARK
  end
  if !square
    square = possible_moves?(brd).sample
  end
  brd[square] = COMPUTER_MARK
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARK }.keys.first
  else
    nil
  end
end

def possible_moves?(brd)
  brd.keys.select { |key| brd[key] == INITIAL_MARK }
end

def possible_moves_string(brd)
  array = possible_moves?(brd)
  nums = array.length - 2
  return "#{array[0..nums].join(', ')} or #{array[-1]}" if array.length > 1
  array[0].to_s
end

def board_full?(brd)
  possible_moves?(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARK) == 3
      return "You"
    elsif brd.values_at(*line).count(COMPUTER_MARK) == 3
      return "Computer"
    end
  end
  nil
end

def match_winner?(plr_scr, comp_scr)
  return "You" if plr_scr == 5
  return "Computer" if comp_scr == 5
end

def place_piece!(brd, current_player)
  player_turn!(brd) if current_player == "You"
  computer_turn!(brd) if current_player == "Computer"
end

def alternate_player(player)
  case player
  when "You" then player = "Computer"
  when "Computer" then player = "You"
  end
  player
end

# BEGIN GAME
prompt("Welcome Player X!")
prompt("Would you like to play a" \
       "\n      1) Single Game" \
       "\n      2) Five Game Tournament")
game_length = gets.chomp.to_i

FIRST_MOVE = who_goes_first?

loop do # MATCH LOOP
  current_player = FIRST_MOVE
  match_counter += 1
  board = initialize_board

  loop do # SINGLE GAME LOOP
    display_board(board, match_counter, game_length)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    display_board(board, match_counter, game_length)
    break if someone_won?(board) || board_full?(board)
  end

  if someone_won?(board)
    winner = detect_winner(board)
    player_score += 1 if winner == 'You'
    computer_score += 1 if winner == 'Computer'
  else
    winner = nil
  end

  if game_length == 1
    if !winner
      prompt("It's a tie game.")
    else
      prompt("#{winner} won the game!")
    end
    prompt("Do you want to play again? (y/n)")
    play_again = gets.chomp.downcase
    break unless play_again == 'y'
  end

  if game_length == 2
    match_winner = match_winner?(player_score, computer_score)
    if !!match_winner
      prompt("#{match_winner} won the match!")
      prompt("You won #{player_score} games")
      prompt("Computer won #{computer_score} games")
      prompt("Rematch? (y/n)")
      rematch = gets.chomp.downcase
      break unless rematch == 'y'
    end
  end
end # END MATCH LOOP

prompt("Thanks for playing. Goodbye!")
