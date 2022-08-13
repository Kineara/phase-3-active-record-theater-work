class Role < ActiveRecord::Base 
  has_many :auditions

  def actors 
    self.auditions.all.pluck(:actor)
  end

  def locations
    self.auditions.all.pluck(:location)
  end

  def lead
    lead_role = self.auditions.find_by hired: true
    lead_role == nil ? 'no actor has been hired for the role' : lead_role
  end

  def understudy
    under_role = self.auditions.where(hired:true).second
    under_role == nil ? 'no actor has been hired for understudy for the role' : under_role
  end
end