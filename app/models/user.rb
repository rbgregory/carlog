class User < ActiveRecord::Base
  has_many :cars
  has_many :logs

  has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 3}  #on create: only when creating a user, not updating

  def admin?
    self.role == 'admin'
  end

  def moderator?
    self.role == 'moderator'
  end

end
