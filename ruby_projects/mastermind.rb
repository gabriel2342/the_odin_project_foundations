require './computer_code_break.rb'

class MasterMind
  include CompCodebreak

  def secret_code 
     @comp_move = []
     4.times do
       @comp_move << rand(1..6)
    end
    @comp_move
  end

  def player_choice
    puts "Would you like to be the codebreaker or codemaker? Type in 'breaker' or 'maker'"
    @play_choice = gets.chomp
    @play_choice.downcase == 'breaker' ? true : false
  end

  def number_of_rounds
    loop do 
      puts "How many rounds would you like to play? Choose an even number between 8-12"
      @rounds_number = gets.chomp.to_i
      round_arr = [8,10,12]
      break if round_arr.include?(@rounds_number)
    end
    @rounds_number
  end

  def round_int
    @round_number = @rounds_number
  end

  def player_move
    @player_mov = []
    puts "Please enter your guess in a 1234 format: "
    @player_guess = gets.chomp
    @player_mov = @player_guess.chars.map(&:to_i)
    @player_mov
  end

  def winner?
    if @comp_move.join.to_i == @player_mov.join.to_i
      puts "Winner, winner, chicken dinner."
      true
    end
  end

  def hint #BUG - I'm getting two partial when I should be only getting one
    matches = []
    partial = []
    comp_mov = @comp_move.dup
    @player_mov.each_with_index do |num, i|
      if num == @comp_move[i]
        matches << num
        p comp_mov
      elsif comp_mov.include?(num)
        partial << num 
        comp_mov.delete(num)
        p comp_mov
      end
    end
    puts "Matches: #{matches.size}"
    puts "Partials: #{partial.size}"
  end


end


game = MasterMind.new

if game.player_choice
  p game.secret_code
  game.number_of_rounds
  counter = game.round_int
  game.round_int.times do
    game.player_move
    game.winner? ? break : game.hint
    counter -= 1
    puts "You have #{counter} guesses remaining"
  end
else 
  game.total_codes
  game.player_code_set
  game.first_move
  20.times do
    game.comp_hint 
    game.comp_code_cull
    choice = game.comp_choice
    puts "The computers choice is #{choice}"
    break if game.comp_winner?  
  end
end
  



