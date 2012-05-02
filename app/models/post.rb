class Post < ActiveRecord::Base
  belongs_to :ring
  attr_accessible :content
end
