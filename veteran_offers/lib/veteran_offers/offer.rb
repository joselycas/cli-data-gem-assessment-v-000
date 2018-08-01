class VeteranOffers::Offer
  attr_accessor :details, :discount_type, :link

  @@all = []

  def initialize(details = nil, discount_type = nil, link = nil)
    @details = details
    @discount_type = discount_type
    @link = link
    @@all << self
  end

  def self.all
    @@all
  end
end
