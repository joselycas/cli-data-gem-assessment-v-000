class VeteranOffers::Scraper

  def self.scrape_vawebsite
    doc = Nokogiri::HTML(open("https://members.veteransadvantage.com/deals/travel-lifestyle"))
    doc.css(".discount").each do |discount|
      offer = VeteranOffers::Offer.new
      offer.details = discount.css(".description p").text.gsub("\n", "")
      offer.discount_type = discount.css(".discount-type").text.gsub("\n", "")
      offer.link = "https://members.veteransadvantage.com/deals" + discount.attr("href")
    end
  end
end
