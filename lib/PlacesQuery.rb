class PlacesQuery
    
    attr_accessor :country, :raw_query_data, :data

    # def initialize()
    #     @searchtype = searchtype
    #     @longitude = longitude
    #     @latitude = latitude
    #     @radius = radius
    #     #@searchrankby = searchrankby
    # end

    def self.query_to_hash
        #fetches all data from the API
        url = "https://restcountries.eu/rest/v2/all" 
        raw_query_data = RestClient.get(url)
        data = JSON.parse(raw_query_data.body)
        data.each {|key| Country.new(key["name"],key["region"],key["capital"],key["currencies"]) }
        binding.pry
        #Lead.new_from_json(data)
    end

    #def self.hash_to_names(data)
        
        
    #end

end

