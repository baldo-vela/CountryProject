class Cli
    def call
        welcome 
        PlacesQuery.query_to_hash #debatable where in the flow control to load this volume of data
        main_menu
        goodbye
    end

    def welcome
        puts "Welcome to the Country Information Gem! .\nHello User!"
    end

    def main_menu
        input = nil
        while input != "exit" #user input loop, breaks on exit
            puts "1. List all Countries in the World from A-Z"
            puts "2. Today's Country of the Day"
            puts "3. Tell more about a Country"
            puts "Please select a function or type 'exit'"
            input = gets.strip.downcase

            if input.to_i > 0 
                case input.to_i 
                when 1
                    #List all countries
                    list_countries
                when 2
                    #A random country with full details
                    country_of_the_day
                when 3
                    #Take a specific number of a country to print details about it, has it's own submenu system
                    specific_country
                end
            else
                puts "Not sure what you want, please select a number from the list or exit."
            end
        end
    end
#-Menu Functional Methods----------------------------------------------------------------------------------------------------------------------------
    def list_countries
        #This is a simple method to demonstrate proficiency with itterative access of an array of a class objects 
        puts "Behold all the Countries in the World:"
        Country.all.each.with_index(1) { |lead, i| puts "#{i}. #{lead.name} " }
    end

    def country_of_the_day
        #when called will issue full details of a random country from the list
        temp = Country.all.sample 
        puts "###Today's Country of the Day is #{temp.name}###"
        would_like_to_know_more_about(temp) #calls the country detailer method
    end

    def would_like_to_know_more_about(temp)
        #Displays interprolated variable data for the passed instance of the Country class
        puts " -----*Dossier for #{temp.name}*----- "
        puts "Alternate Spellings:  \t#{temp.altSpellings.flatten}"
        puts "Translations: \t\t #{temp.translations.flatten}"
        puts "Native Name: \t\t #{temp.nativeName}"
        puts "Captial City: \t\t #{temp.capital}"
        puts "Population: \t\t #{temp.population} people"
        puts "Timezone: \t\t #{temp.timezones.flatten}"
        puts "Spoken Languages:  \t#{temp.languages.flatten}"
        puts "Currencies: \t #{temp.currencies.flatten}"
        puts "\n"
        puts "Lattitude & Longitude: #{temp.latlng.flatten}"
        puts "Borders: \t\t #{temp.borders.flatten}"
        puts "Geographic Region: #{temp.region}"
        puts "Regional Bloc(s): \t #{temp.regionalBlocs.flatten}"
        puts "Area (km^2): \t #{temp.area}"

        puts "-Internet and Telephony Information-"
        puts "Top Level Domain: \t #{temp.topLevelDomain.flatten}"
        puts "Alpha Codes: \t\t #{temp.alpha2Code}, #{temp.alpha3Code}"
        puts "Calling Code: \t\t #{temp.callingCodes.flatten}"
        puts "Numeric Code: \t\t #{temp.numericCode}"

        #end of entry feature
        puts "\n -----------End of Line--------- "

    end

    def specific_country
        #Sub menu that Prompts user to select a country by name or number and then calls the detailer function
        input = nil
        while input != "exit" #user input loop, breaks on exit

            puts "Please select a country by list number or type 'exit' to exit this menu"
            input = gets.strip.downcase

            if input.to_i > 0 && input.to_i < Country.all.length
                would_like_to_know_more_about(Country.all[(input.to_i - 1)])
            else
                puts "Not sure what you want, please select a number from the list of countries or exit."
            end
        end    
    end


    def cv_to_s(temp) #Work in progress, but seems unecessarily complicated
        #Type Checking isn't a well supported Ruby methodology, but the varity of instance variables have formatting issues that require sanitization before being string interpolated
        if (temp.is_a?(Numeric) == true) || (temp.is_a?(String) == true)
            #check if the variable is a string, a string superclass, numeric or numeric super class or not
            return temp
        else
            #check 

        end


    end

    def goodbye
        puts "Thank you for using this gem!"
    end

end