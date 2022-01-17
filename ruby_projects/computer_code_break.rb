
module CompCodebreak
  def initialize
    @total_codes = []
    (1111..6666).each {|num| @total_codes << num}
    @comp_set = @total_codes.dup.uniq
  end

  def first_move
    @comp_move = 1122
  end
    
  def player_code_set
    @player_code = []
    puts "Please enter your super secret code in a 1234 format: "
    @player_code = gets.chomp.to_i
    @player_code@player_code.digits
    if @player_guess.to_s.size == 4 && @player_guess.to_i == @player_guess
      true
    else
      puts "Please follow directions. Enter your guess in a 1234 format."
      false
    end
  end
    
  def comp_hint
    @num_hint = []
    (0..3).each do |i|
      if  @comp_move[i] == @player_move[i]
        @num_hint << 'Y'
      elsif @player_move.include?(@comp_move[i])
        @num_hint << 'A'
      end
    end
    @num_hint = @num_hint.sort.reverse
  end

  def comp_code_cull #need to change this so hint array is generated for each number    
    @comp_set.each do |num|
      if @num_hint == @hint_array
        next
      else
        @comp_set.delete(num)
      end
    end
    p @comp_set
  end

  def which_side?
    puts "Would you like to be the codemaker or codebreaker? Please enter maker or breaker."
    @choice = gets.chomp
  end

  
  
end

