# frozen_string_literal: true

require_relative 'game'

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

# TODO: Convert guesses to hash (to keep history for #display_board, board.full? and ai purposes)
# TODO: Make AI better
# TODO: Make board display nicer
# TODO: Input validation
Game.new.setup_game
