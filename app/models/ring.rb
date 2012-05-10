class Ring < ActiveRecord::Base
  attr_accessible :name, :categorizations_attributes, :categories
  has_many :posts
  has_many :categorizations
  has_many :categories, :through => :categorizations
  accepts_nested_attributes_for :categorizations
end
