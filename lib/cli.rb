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
            puts "Please select a function or type 'exit'"
            input = gets.strip.downcase

            if input.to_i > 0 
                case input.to_i 
                when 1
                    #List all countries
                    list_countries
                when 2..10 #work in progress
                    puts "Sorry User, that functionality is offline."
                end
            else
                puts "Not sure what you want, please select a number from the list or exit."
            end
        end
    end
#-Menu Functional Methods----------------------------------------------------------------------------------------------------------------------------
    def list_countries
        puts "Behold all the Countries in the World:"
        @countries = Country.all
        @countries.each.with_index(1) { |lead, i| puts "#{i}. #{lead.name} " }
        puts "Which country would you like to know more about?"
    end

    def goodbye
        puts "Thank you for using this gem!"
    end

end