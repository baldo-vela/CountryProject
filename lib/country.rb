class Country
    #data container class
    attr_accessor :name, :capital, :region, :currencies

    @@all = []

    def initialize(name,region,capital,currencies)
        @name = name
        @region = region
        @capital = capital
        @currencies = currencies
        @@all <<self
    end

    def self.all
        return @@all
    end
    

end
