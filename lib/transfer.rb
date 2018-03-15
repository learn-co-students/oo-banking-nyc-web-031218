class Transfer
  # your code here
  attr_reader :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount

  end
  def valid?
    @receiver.valid?  && @sender.valid?
  end

  def execute_transaction
    # binding.pry
    if @sender.balance > amount && @status == "pending"
      @receiver.balance+=amount
      @sender.balance-=amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    if @receiver.balance > amount && @status == "complete"
      @receiver.balance-=amount
      @sender.balance+=amount
      @status = "reversed"
    end
  end

end
