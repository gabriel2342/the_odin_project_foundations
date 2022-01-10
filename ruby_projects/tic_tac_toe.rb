

class TicTacToe
  def initializer
    @sq = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def display_board
    puts""
    puts "       |     |"
    puts "    #{@sq[0]}  |  #{@sq[1]}  |  #{@sq[2]}"
    puts "       |     |"
    puts "  -----+-----+-----"
    puts "       |     |"
    puts "    #{@sq[3]}  |  #{@sq[4]}  |  #{@sq[5]}"
    puts "       |     |"
    puts "  -----+-----+-----"
    puts "       |     |"
    puts "    #{@sq[6]}  |  #{@sq[7]}  |  #{@sq[8]}"
    puts "       |     |"
  end

  def player_move(move)
    if @sq[move-1] == " " && move <= 9 && move >= 1
      @sq[move-1] = 'X'
      return true
    else
      puts "Space occupied or out of range. Please enter a valid move"
    end
    false
  end

  def computer_move
    compmove = rand(10)
    while @sq[compmove] != " "
      compmove = rand(10)
    end
    @sq[compmove] = 'O'
  end

  def winner?
    winning_combos = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]] 
    winning_combos.each do |combo|
      checkarr = []
      combo.each do |i| 
        checkarr << @sq[i-1]
      end
      if checkarr.all?('X') 
        puts display_board
        puts "You've won!!!"
        return true
      elsif checkarr.all?('O')
        puts display_board
        puts "Womp Womp wooooooooooow the computer won."
        return true
      end 
    end
    false
  end 

  def is_tie?
    if @sq.any?(" ") == false
      puts display_board
      puts "It's a tie!!! Of course it is, it's Tic-Tac-Toe!"
      return true
    end
    false
  end


end


puts "Welcome to Tic-Tac-Toe!"
loop do
  puts "!!!!!!Let's Play!!!!!!!" 
  board = TicTacToe.new
  board.initializer
  puts board.display_board
  loop do 
    loop do
      puts "Enter your move: "
      move = gets.chomp.to_i
      movebool = board.player_move(move)
      break if movebool != false
    end
    break if board.winner?
    break if board.is_tie?
    board.computer_move
    break if board.winner? 
    puts board.display_board
  end
  puts "Would you like to play another game?"
  game = gets.chomp
  if game.downcase != 'y'
    puts "Goodbye! Thanks for Playing."
    exit
  end
end



