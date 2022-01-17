
module CompCodebreak
  def initialize
    @total_codes = []
    (1111..6666).each {|num| @total_codes << num}
    @comp_set = @total_codes.dup
  end

  def first_move
    @comp_move = 1122
  end

  def player_code
    puts "Please enter your secret code in a 1234 format."
    @play_code = gets.chomp.to_i
  end
    

  def comp_code_cull #need to change this so hint array is generated for each number
    @comp_set.each do |num|
      if num.hint == @hint_array
        next
      else
        @comp_set.delete(num)
      end
    end
    p comp_set
  end


  
end

