class County < ActiveRecord::Base
  has_many :parishes
  has_many :towns
  has_many :users
  
  def parishes_and_towns_for_grouped_select
    return {
      'Vallad' => parishes.order("name").map{ |x| [x.name, x.name] },
      'Linnad' => towns.order("name").map{ |x| [x.name, x.name] }
    }
  end

  def to_s
    name
  end
end