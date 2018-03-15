require 'pry'
require_relative 'bank_account.rb'

class Transfer

  attr_accessor :sender, :receiver, :amount, :status, :balance, :valid

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    @sender.valid? == true && @receiver.valid? == true
  end

  def execute_transaction
    if self.valid? == false || @sender.balance < @amount
      @status = 'rejected'
       "Transaction rejected. Please check your account balance."
    else
      while @status == 'pending'
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = 'complete'
      end
    end
  end

  def reverse_transfer
      if @status == 'complete'
        @sender.balance += @amount
        @receiver.balance -= @amount
        @status = 'reversed'
      end
    end

end
