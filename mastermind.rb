# frozen_string_literal: true

# Plan:
#   ::Player:
#     ::Human
#     ::Ai
#       #select_random_pegs:
#         @code array
#   ::Board:
#       @guesses hash (Turn: pegs)
#       #is_full?
#   ::Game:
#       #setup_game
#       #determine_gamemaster
#       #play_game:
#         get_guess
#         check_win
#       #get_guess:
#         if player:
#
#       #check_win
#         if @guesses.any == @code
#           win
#       #game_over?
