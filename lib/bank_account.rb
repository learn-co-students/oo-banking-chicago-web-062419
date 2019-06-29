class BankAccount

    attr_accessor :balance, :status
    attr_reader :name

    def initialize(name)
        @name = name
        @balance = 1000
        @status = 'open'
    end

    def deposit(amount)
        if amount > 0
            @balance += amount
        else "Must deposit positive amount"
        end
    end

    def withdraw(amount)
        if amount > 0 && amount < balance
            @balance -= amount
        else "Transaction rejected. Please check your account balance."
        end
    end

    def display_balance
        "Your balance is $#{balance}."
    end

    def valid?
        if status == 'open' && balance > 0
            true
        else
            false
        end
    end

    def close_account
        @status = "closed"
    end
end
