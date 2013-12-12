class Town < ActiveRecord::Base
  belongs_to :county
  belongs_to :parish
end
