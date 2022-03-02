require_relative 'math'

class Slots
include Math
attr_accessor :user

  def initialize(user)
    @user = user
    slots_welcome
  end

  def slots_welcome
    print "
     ________       _
    |  \\' __'\\     (_)
    |   \\  /  \\    /
    |    \\_____\\__/_  
    |     |__________|
    |    /           /
    |___/___________/ 
    "
    puts "Hello" + " " + @user.full_name + "!"
    puts " --Welcome to our Slots game!-- "
    puts " - Insert your wager - "
    puts " - Pull the lever - "
    puts " - Make money! - "
    puts " - ------------ - "

    slots_game
  end

  def slots_game
    puts " - How much will you wager? - "
    wager = gets.strip.to_f
    lever 
    show_lever_result
    if @result1 == @result2 && @result2 == @result3
      puts " --Winner!-- "
      puts " - Your Bankroll was: $ #{@user.bank} - "
      winnings = @user.bank + (wager * 4)
      @user.change_wallet(winnings)
      puts " - Your Bankroll is now: $ #{@user.bank} - "
    else
      puts " - Sorry, maybe next time - "
      puts " - Your Bankroll was: $ #{@user.bank} - "
      losings = @user.bank - wager
      @user.change_wallet(losings)
      puts " - Your Bankroll is now: $ #{@user.bank} - "
    end

    puts " --------------------------------- "
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
  
  def lever
    @result1 = rand(10)
    @result2 = rand(10)
    @result3 = rand(10)
  end

  def show_lever_result
    puts " | #{@result1} | " + " | #{@result2} | " + " | #{@result3} | "
  end

  def loop_this_bitch
    slots_game
  end
end

# def dice_game
#   puts " - How much will you wager? - "
#   wager = gets.strip.to_f
#   puts " - Place your bet - "
#   user_guess = gets.strip.to_i
#   roll
#   show_sum
#   if user_guess == @dice_total
#     puts " --Winner!-- "
#     puts " - Your Bankroll was: $ #{@user.bank} - "
#     winnings = @user.bank + wager
#     @user.change_wallet(winnings)
#     puts " - Your Bankroll is now: $ #{@user.bank} - "
#   else 
#     puts " - Sorry, maybe next time - "
#     puts " - Your Bankroll was: $ #{@user.bank} - "
#     losings = @user.bank - wager
#     @user.change_wallet(losings)
#     puts " - Your Bankroll is now: $ #{@user.bank} - "
#   end

#   puts " - Would you like to play again? - "
#   puts "1. Play again"
#   puts "2. Exit"
#   user_input = gets.strip.to_i
#   if user_input == 1
#     loop_this_bitch
#   elsif user_input == 2
#     exit
#   else
#     " - - Error: Please choose a valid menu item - - "
#   end
# end