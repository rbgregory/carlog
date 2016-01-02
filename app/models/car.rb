class Car < ActiveRecord::Base
  belongs_to :user
  has_many :logs

  def car_name
    "#{self.year} #{self.make} #{self.model}"
  end
end
