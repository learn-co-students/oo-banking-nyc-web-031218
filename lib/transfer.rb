require 'pry'

class Transfer
  # your code here
  attr_writer :sender, :receiver, :amount, :status
  attr_reader :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.status != 'complete'
      self.sender.balance -= amount
      self.receiver.balance += amount
      self.status = 'complete'
    end
    if !(self.sender.valid?)
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == 'complete'
      self.sender.balance += amount
      self.receiver.balance -= amount
      self.status = 'reversed'
    end
  end
end

#first_transfer = Transfer.new(Patricia,Helen,'50')
