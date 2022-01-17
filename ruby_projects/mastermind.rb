require './computer_code_break.rb'

class MasterMind
 include CompCodebreak

  def secret_code 
    @comp_move = []
    4.times do
      @comp_move << rand(6)
    end
    @comp_move
  end

  def which_side?
    puts "Would you like to be the codemaker or codebreaker? Please enter maker or breaker."
    @choice = gets.chomp
  end



  def player_move
    @player_move = []
    puts "Please enter your guess in a 1234 format: "
    @player_guess = gets.chomp.to_i
    @player_guess.digits.each {|digit| @player_move << digit.to_i}
    p @player_guess
    if @player_guess.to_s.size == 4 && @player_guess.to_i == @player_guess
      true
    else
      puts "Please follow directions. Enter your guess in a 1234 format."
      false
    end
  end

  def winner?
    if @player_move == @comp_move 
      puts "YOU DID IT! YOU BROKE THE CODE!!!"
        true
    else
      false
    end
  end

  def hint
    @hint_array = []
    (0..3).each do |i|
      if @player_move[i] == @comp_move[i]
        @hint_array << 'Y'
      elsif @comp_move.include?(@player_move[i])
        @hint_array << 'A'
      end
    end
    @hint_array.sort.reverse
  end


end

game = MasterMind.new
p game.secret_code
while game.player_move == false
  game.player_move
end
game.winner?
p game.hint
game.comp_code_cull

