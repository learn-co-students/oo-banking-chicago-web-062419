require 'pry'

class Transfer
  
  attr_accessor :status, :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @status = "pending"
      @amount = amount
  end

  def valid
    if @sender.valid? && @receiver.valid?
      true 
    else
      false 
    end
  end

  def execute_transaction
    if valid && @amount < @sender.balance
      if @status == "pending"
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
      else
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
    else
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end

# avi = BankAccount.new("Avi")
# amanda = BankAccount.new("Amanda")
# transfer = Transfer.new(amanda, avi, 50)
# # bad_transfer = Transfer.new(amanda, avi, 4000)

# # p bad_transfer.execute_transaction
# p transfer.execute_transaction
# binding.pry