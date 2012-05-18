class Categorization < ActiveRecord::Base
  attr_accessible :category_id, :ring_id, :category
  belongs_to :ring
  belongs_to :category
end
