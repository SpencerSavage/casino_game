# require 'pry'
require_relative 'math'

class Dice
  include Math
  attr_accessor :user

  def initialize(user)
    @user = user
    dice_welcome
  end

  def dice_welcome
    print "
     ____
    /\\' .\\    _____
   /: \\___\\  / .  /\\
   \\' / . / /____/..\\
    \\/___/  \\'  '\\  /
             \\'__'\\/
    "
    puts "Hello" + " " + @user.full_name + "!"
    puts " --Welcome to our dice game!-- "
    puts " - We will roll 2 dice - "
    puts " - Simply guess the sum of the 2 dice correctly and you win! - "
    puts " - Let's begin! - "
    puts " - ------------ - "
    dice_game
  end

  def dice_game
    puts " - How much will you wager? - "
    wager = gets.strip.to_f
    puts " - Place your bet - "
    user_guess = gets.strip.to_i
    roll
    show_sum
    if user_guess == @dice_total
      puts " --Winner!-- "
      puts " - Your Bankroll was: $ #{@user.bank} - "
      winnings = @user.bank + (wager * 2)
      @user.change_wallet(winnings)
      puts " - Your Bankroll is now: $ #{@user.bank} - "
    else 
      puts " - Sorry, maybe next time - "
      puts " - Your Bankroll was: $ #{@user.bank} - "
      losings = @user.bank - wager
      @user.change_wallet(losings)
      puts " - Your Bankroll is now: $ #{@user.bank} - "
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

  def roll
    @die1 = 1 + rand(1)
    @die2 = 1 + rand(1) 
    @dice_total = @die1 + @die2
  end

  
  def show_sum
    puts "Sum of dice is: " + "#{@dice_total}" + "\n"
  end 

  def loop_this_bitch
    dice_game
  end
end

