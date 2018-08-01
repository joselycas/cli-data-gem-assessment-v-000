#cli controller

class VeteranOffers::CLI
    def call
      VeteranOffers::Scraper.scrape_vawebsite
      list_deals
      menu
      goodbye
    end

    def list_deals
      puts "Veteran Deals:"
      VeteranOffers::Offer.all.each.with_index(1) do |offer,i|
        puts "#{i}. #{offer.details} "
      end
    end

    def menu
      input = nil
      while input != "exit"
        puts "Please enter the deal you would like more info on 1-24, type list for all deals or exit."
        input = gets.strip.downcase
        if input.to_i > 0 && input.to_i <= VeteranOffers::Offer.all.length
          deal = VeteranOffers::Offer.all[input.to_i-1]
          puts "#{deal.details}"
          puts "#{deal.discount_type}"
          puts "#{deal.link}"
        elsif input == "list"
          list_deals
        elsif input == "exit"
          break
        else
          puts "Sorry that is not an option please type list or exit"
        end
      end
    end

    def goodbye
      puts "See you next time!"
    end

  end
