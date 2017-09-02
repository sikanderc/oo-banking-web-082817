require "pry"
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?(*)
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction(*)
    if self.sender.valid?
      # binding.pry
      if @status == "pending"
        self.sender.balance -= @amount
        self.receiver.balance += @amount
        if self.sender.balance < 0
          @status = "rejected"
          "Transaction rejected. Please check your account balance."
        else
          @status = "complete"
        end
      end
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      self.sender.balance += @amount
      self.receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
