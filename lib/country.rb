class Country
    #data container class
    attr_accessor :name, :topLevelDomain, :alpha2Code, :alpha3Code, :callingCodes, :capital, :altSpellings, :region, :subregion, :population, :latlng, :demonym, :area, :gini, :timezones, :borders, :nativeName, :numericCode, :currencies, :languages, :translations, :flag, :regionalBlocs, :cioc

    @@all = []

    def initialize(name, topLevelDomain, alpha2Code, alpha3Code, callingCodes, capital, altSpellings, region, subregion, population, latlng, demonym, area, gini, timezones, borders, nativeName, numericCode, currencies, languages, translations, flag, regionalBlocs, cioc)
        @name           = name
        @topLevelDomain = topLevelDomain
        @alpha2Code     = alpha2Code
        @alpha3Code     = alpha3Code
        @callingCodes   = callingCodes
        @capital        = capital
        @altSpellings   = altSpellings
        @region         = region
        @subregion      = subregion
        @population     = population
        @latlng         = latlng
        @demonym        = demonym
        @area           = area
        @gini           = gini
        @timezones      = timezones
        @borders        = borders
        @nativeName     = nativeName   
        @numericCode    = numericCode
        @currencies     = currencies
        @languages      = languages
        @translations   = translations
        @flag           = flag
        @regionalBlocs  = regionalBlocs
        @cioc           = cioc
        
        @@all <<self
    end

    def self.all
        return @@all
    end
    

end
