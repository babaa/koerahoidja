class User < ActiveRecord::Base
  has_many :photos
  belongs_to :county 
  belongs_to :parish 
  belongs_to :town
end
