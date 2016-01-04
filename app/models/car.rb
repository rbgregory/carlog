class Car < ActiveRecord::Base
  belongs_to :owner, foreign_key: 'user_id', class_name: 'User'
  has_many :logs
  validates :make, presence: true
  validates :model, presence: true
  validates :year, presence: true

  def car_name
    "#{self.year} #{self.make} #{self.model}"
  end

  def log_total
    total = 0
    self.logs.each do |log|
      total += log.price
    end
    total
  end

end
