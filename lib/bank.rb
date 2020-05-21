class Bank
    attr_reader :name, :city

    @@all = []

    def initialize(name, city)
        @name = name
        @city = city
        @@all << self
    end

    def self.all
        @@all
    end

    def customers
        bank_accts = Account.all.select  {|account| account.bank == self}
        bank_accts.map do |bank_acct|
            bank_acct.customer.name
        end.uniq
    end

    def self.customer_count
        @@all.map do |bank|
            {bank_name: bank.name, customer_number: bank.customers.length}
        end
    end
    
     def self.most_customers

        Sorted_banks = Bank.customer_count.sort_by(customer_number)
        
    end
end 
