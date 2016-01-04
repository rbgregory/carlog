class Log < ActiveRecord::Base
  belongs_to :car
  belongs_to :owner, foreign_key: 'user_id', class_name: 'User'

  validates :date, presence: true
  validates :mileage, presence: true
  validates :vendor, presence: true
  validates :price, presence: true
  validates :description, presence: true
end
