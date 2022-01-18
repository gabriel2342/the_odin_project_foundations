
module CompCodebreak
  def initialize
    @total_codes = []
    (1111..6666).each {|num| @total_codes << num}
    @comp_set = @total_codes.dup.uniq
  end

  def first_move
    @comp_move = [1,1,2,2]
  end

  def comp_choice
    @comp_move = @comp_set.shift.to_s.chars.map(&:to_i)
  end
     
  def player_code_set
    @player_code = []
    puts "Please enter your super secret code in a 1234 format: "
    play_code = gets.chomp.to_i
    @player_code = play_code.to_s.chars.map(&:to_i)
    p @player_code
  end
    
  def comp_hint
    
    p black = @player_code.zip(@comp_move).count{|i| i.inject(:eql?)}
    p white = @comp_move.uniq.count{|i| @player_code.include?(i)}
    p @hint_array = [black, white]
  end

  def comp_code_cull  
    comp_guess = []   
    @comp_set.each do |num|
      comp_guess = num.to_s.chars.map(&:to_i)
      black = @player_code.zip(comp_guess).count{|i| i.inject(:eql?)}
      white = comp_guess.uniq.count{|i| @player_code.include?(i)}
      check_arr = [black,white]
      @comp_set.delete(num) if check_arr != @hint_array
    end
    @comp_set
  end

  def comp_winner?
    p @comp_move == @player_code
  end
end

