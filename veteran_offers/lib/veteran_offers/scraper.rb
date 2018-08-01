class VeteranOffers::Scraper

  def self.scrape_vawebsite
    doc = Nokogiri::HTML(open("https://members.veteransadvantage.com/deals/travel-lifestyle"))
    doc.css(".discount").collect do |discount|
      offer = VeteranOffers::Offer.new
      offer.details = discount.css(".description p").text.gsub("\n", "")
      offer.discount_type = discount.css(".discount-type").text.gsub("\n", "")
      offer.link = discount.attr("href")
      offer
    end
  end
end
