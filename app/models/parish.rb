class Parish < ActiveRecord::Base
  belongs_to :county
  has_many :towns, order: 'name'
  has_many :users
  
  def towns_for_select
    towns.map{ |x| [x.name, x.name] }
  end
end
