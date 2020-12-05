class PlacesQuery
    
    attr_accessor :raw_query_data, :data


    def self.query_to_hash
        #fetches all data from the API
        url = "https://restcountries.eu/rest/v2/all" 
        raw_query_data = RestClient.get(url)
        data = JSON.parse(raw_query_data.body)

        #okay this is gonna be ugly, and there's probably a way to do this dynamically for a ton of parameters from the resulting hash, but hell if I got time for that
        data.each {|key| Country.new(key["name"], key["topLevelDomain"], key["alpha2Code"], key["alpha3Code"], key["callingCodes"], key["capital"], key["altSpellings"], key["region"], key["subregion"], key["population"], key["latlng"], key["demonym"], key["area"], key["gini"], key["timezones"], key["borders"], key["nativeName"], key["numericCode"], key["currencies"], key["languages"], key["translations"], key["flag"], key["regionalBlocs"], key["cioc"]) }

        #binding.pry
   
    end

    #def self.hash_to_names(data)
        
    #end

end

