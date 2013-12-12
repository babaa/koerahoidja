class User < ActiveRecord::Base
  has_many :photos
  has_one :county 
  has_one :parish 
  has_one :town
end
