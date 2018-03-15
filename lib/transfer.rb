require "pry"

class Transfer

  attr_accessor :sender, :receiver, :status
  attr_reader :amount

  def initialize(sender, receiver, num)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = num
  end

  def valid?
    #binding.pry
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    #binding.pry
    if self.valid? && self.status == 'pending' && @sender.balance > @amount
      #binding.pry
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
      #then reciever += amount_to_change then - senders balance
  end

  def reverse_transfer
    if self.valid? && self.status == 'complete' && @receiver.balance > @amount
      @receiver.deposit(-@amount)
      @sender.deposit(@amount)
      self.status = "reversed"
    end
  end

end
