class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  @@account = []

  def initialize(name)

    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(money)
    @balance += money
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?(*)
    return true if self.status == "open" && self.balance > 0
    false
  end

  def close_account
    @status = "closed"
  end
end
