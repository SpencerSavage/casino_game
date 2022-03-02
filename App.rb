require_relative 'user'
require_relative 'dice'
require_relative 'slots'
require_relative 'hilo'
# require 'colorize'

class App 
  attr_accessor :user 

  def initialize
    welcome
    @user = create_user
  end

  def welcome
    puts "---Welcome to Vegas!---"
  end

  def create_user
    puts "---What is your first name?---"
    f_name = gets.strip
    puts "---What is your last name?---"
    l_name = gets.strip
    puts "---How much are you playing with today?---"
    bank = gets.strip.to_f

    @user = User.new(f_name, l_name, bank)
    menu
  end


  def menu 
    puts "---What would you like to do?---"
    puts "1. Play Slots"
    puts "2. Play Dice"
    puts "3. Play High Low"
    puts "4. Check Bankroll"
    puts "5. Exit"
    menu_choice = gets.strip.to_i 

    if menu_choice == 1 
      Slots.new(@user)
    elsif menu_choice == 2
      Dice.new(@user)
    elsif menu_choice == 3
      Hilo.new(@user)
    elsif menu_choice == 4
      puts "#{@user.wallet}"
      menu
    elsif menu_choice == 5
      puts "Thank you for playing, come again soon!"
      exit
    else
      puts "Error, please choose a valid menu item"
      menu
    end
  end
end

app = App.new