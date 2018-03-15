class BankAccount

 attr_reader :name
 attr_accessor :balance, :status

  ALL = []

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    ALL << self
  end

 def deposit(amount)
   @balance += amount
 end

 def withdraw(amount)
   @balance -= amount
 end


 def display_balance
    "Your balance is $#{balance}."
 end

 def valid?
   if status == "open" && @balance > 0
     return true
   else
     false
   end
 end

  def close_account
    @status = "closed"
  end

  def self.all
    ALL
  end




end
