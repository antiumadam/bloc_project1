class Ring < ActiveRecord::Base
  attr_accessible :name, :categorizations_attributes, :categories, :latitude, :longitude
  has_many :posts
  has_many :categorizations
  has_many :categories, :through => :categorizations
  accepts_nested_attributes_for :categorizations
  
  after_create :save_categories
  
  def categories=(attributes)
    category = Category.find_or_create_by_name(attributes[:name])
    categorizations.new(:category => category)
  end
  
  def save_categories
    categorizations.each(&:save!)
  end
end
