class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    return @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if self.valid? && @sender.balance > @amount && @status == 'pending'
      @receiver.deposit(@amount)
      @sender.balance -= @amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.balance -= @amount
      @sender.deposit(@amount)
      @status = "reversed"
    end
  end

end
