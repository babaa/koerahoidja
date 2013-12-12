class Town < ActiveRecord::Base
  belongs_to :county
  belongs_to :parish
  has_many :users
end
