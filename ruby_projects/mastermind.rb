
class MasterMind

  @@options = [1,2,3,4,5,6].freeze

  def secret_code 
    @comp_move = []
    4.times do
      @comp_move << @@options.sample
    end
    @comp_move
  end

  def player_move
    @player_move = []
    puts "Please enter your guess in a 1234 format: "
    @player_guess = gets.chomp.to_i
    @player_guess.to_s.each_char {|digit| @player_move << digit.to_i}
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
    hint_array = []
    (0..3).each do |i|
      if @player_move[i] == @comp_move[i]
        hint_array << 'Y'
      elsif @comp_move.include?(@player_move[i])
        hint_array << 'A'
      else
        hint_array << 'N'
      end
    end
    hint_array
  end


end

game = MasterMind.new
p game.secret_code
while game.player_move == false
  game.player_move
end
game.winner?
p game.hint

