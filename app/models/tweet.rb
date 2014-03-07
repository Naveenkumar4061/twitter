class Tweet < ActiveRecord::Base
  attr_accessible :user_id, :text
  belongs_to :user
end
