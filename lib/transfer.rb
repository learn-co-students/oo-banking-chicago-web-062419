require "pry"

class Transfer
  	attr_accessor :sender, :receiver, :status, :amount
  
	def initialize(sender, receiver, status = "pending", amount)
		@sender = sender
		@receiver = receiver
		@status = status
		@amount = amount  
	end

	def valid?
		self.sender.valid? && self.receiver.valid?
	end

	def execute_transaction
		if self.valid? && @status == "pending" && @sender.balance > amount
			@sender.balance -= @amount
			@receiver.balance += @amount
			@status = "complete"
		else
			# I don't believe this code would ever run because all instances of transfer put forth by the test passes validity above.
			# @sender.valid? == false
			@status = "rejected"
			"Transaction rejected. Please check your account balance."
		end
	end

	def reverse_transfer
		if self.valid? && @status == "complete"
			@sender.balance += @amount
			@receiver.balance -= @amount
			@status = "reversed"
		end
	end
end