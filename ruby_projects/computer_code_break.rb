
module CompCodebreak
  def total_codes
    @total_code = []
    (1111..6666).each {|num| @total_code << num if num.to_s.match(/^[1-6]{4}$/)}
    @comp_set = @total_code.dup.uniq
  end

  def first_move
    @comp_move = [1,1,2,2]
  end

  def comp_choice
    p @comp_set
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
    
    black = @player_code.zip(@comp_move).count{|i| i.inject(:eql?)}
    white = @comp_move.uniq.count{|i| @player_code.include?(i)}
    @hint_array = [black, white]
  end

  def comp_code_cull  
    comp_guess = []   
    @comp_set.each do |num|
      comp_guess = num.to_s.chars.map(&:to_i)
      black = @player_code.zip(comp_guess).count{|i| i.inject(:eql?)}
      white = comp_guess.uniq.count{|i| @player_code.include?(i)}
      check_arr = [black,white]
      check_arr == @hint_array ? next : @comp_set-= [num]
    end
    @comp_set
  end

  def comp_winner?
    @comp_move == @player_code
  end
end

