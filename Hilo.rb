require_relative 'math'
# require_relative 'deck'

class Hilo
include Math
attr_accessor :user

  def initialize(user)
    @user = user
    @cards = %w( 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 )
    @table = []
    hilo_welcome
  end

  def hilo_welcome
    print "
     ________
    | K  ____|___
    |   | A  _   |
    |   |   ( )  |
    |   |  (_'_) |
    |___|    |   |
        |_______V|

    "
    puts "Hello" + " " + @user.full_name + "!"
    puts " --Welcome to our Hi-Low game!-- "
    puts " - We will draw and display a card - "
    puts " - You must guess if the next card drawn will be lower or higher - "
    puts " - Ace is low, King is high - "
    puts " - If you guess correctly, you win! - "
    puts " - Let's begin! - "
    puts " - ------------ - "
    hilo_game
    shuffle
    loop_this_bitch
  end

  def hilo_game
    shuffle
    puts " - How much will you wager? - "
    wager = gets.strip.to_f
    puts " - 1. High - "
    puts " - 2. Low - "
    user_guess = gets.strip.to_i

    puts " - The first card is: - "
    puts "#{@table[0]}." + "\n"
    puts " - The second card is: - "
    puts "#{@table[1]}." + "\n"
    
    if user_guess == 1 && @table[0] < @table[1] 
      puts " --Winner!-- "
      puts " - Your Bankroll was: $ #{@user.bank} - "
      winnings = @user.bank + (wager * 2)
      @user.change_wallet(winnings)
      puts " - Your Bankroll is now: $ #{@user.bank} - "
    elsif user_guess == 1 && @table[0] > @table[1]
      puts " - Sorry, maybe next time - "
      puts " - Your Bankroll was: $ #{@user.bank} - "
      losings = @user.bank - wager
      @user.change_wallet(losings)
      puts " - Your Bankroll is now: $ #{@user.bank} - "
    elsif user_guess == 2 && @table[0] > @table[1] 
      puts " --Winner!-- "
      puts " - Your Bankroll was: $ #{@user.bank} - "
      winnings = @user.bank + (wager * 2)
      @user.change_wallet(winnings)
      puts " - Your Bankroll is now: $ #{@user.bank} - "
    elsif user_guess == 2 && @table[0] < @table[1]
      puts " - Sorry, maybe next time - "
      puts " - Your Bankroll was: $ #{@user.bank} - "
      losings = @user.bank - wager
      @user.change_wallet(losings)
      puts " - Your Bankroll is now: $ #{@user.bank} - "  
    elsif @table[0] == @table[1]
      puts " --Tie--"
      puts " - Break even - "
      puts " - Your Bankroll is: $ #{@user.bank}"
    end

    puts " - Would you like to play again? - "
    puts "1. Play again"
    puts "2. Exit"
    user_input = gets.strip.to_i
    if user_input == 1
      loop_this_bitch
    elsif user_input == 2
      exit
    else
      " - - Error: Please choose a valid menu item - - "
    end
  end

  def shuffle
    @table << @cards.to_a.shuffle[0]
    @table << @cards.to_a.shuffle[1]
  end

  def loop_this_bitch
    hilo_game
  end
end