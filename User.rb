class User 
  attr_accessor :first_name, :last_name, :age, :bank

  def initialize(first_name, last_name, bank)
    @first_name = first_name
    @last_name = last_name
    @bank = bank
  end

  def full_name 
    "#{first_name} #{last_name}"
  end

  def wallet
    puts "What's in your wallet?"
    puts "$" + "#{bank}"
  end

  def change_wallet(num)
    @bank = num
  end
end