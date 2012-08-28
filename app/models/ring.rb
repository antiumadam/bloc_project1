class Ring < ActiveRecord::Base 
  attr_accessible :name, :categorizations_attributes, :categories, :size, :latitude, :longitude
  has_many :posts, dependent: :destroy
  has_many :categorizations
  has_many :categories, :through => :categorizations
  accepts_nested_attributes_for :categorizations
  
  geocoded_by :location
  after_validation :geocode
  
  after_create :save_categories
  
  def location
    location = "#{self.latitude}, #{self.longitude}"
  end
  
  
  def self.inside(lat, lon)
    near([lat, lon], 20).select {|i| (i.size * 0.5) >= i.distance_from([lat,lon])}
  end
  
  def categories=(attributes)
    category = Category.find_or_create_by_name(attributes[:name])
    categorizations.new(:category => category)
  end
  
  def save_categories
    categorizations.each(&:save!)
  end
end
