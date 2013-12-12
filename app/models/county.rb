class County < ActiveRecord::Base
  has_many :parishes
  has_many :towns

  def parishes_and_towns_for_select
    p = parishes.map{ |x| [x.name, x.name] }
    t = towns.where(parish_id: nil).map{ |x| [x.name, x.name] }
    (p + t).sort_by{ |x| x[0] }
  end

  def to_s
    name
  end
end