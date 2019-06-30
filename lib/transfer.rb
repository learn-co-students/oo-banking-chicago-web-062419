require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    end
  end

  def execute_transaction
    if valid? && @status == "pending"
      if @sender.balance < amount
        @status = "rejected"
        # binding.pry
        return "Transaction rejected. Please check your account balance."
      end
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      return "Transaction rejected. Please check your account balance."
      @status = "rejected"
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    else
      return
    end
  end

end