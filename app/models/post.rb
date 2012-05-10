class Post < ActiveRecord::Base
  belongs_to :ring
  belongs_to :user
  attr_accessible :content, :user_id
end
