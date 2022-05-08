class User < ApplicationRecord
  after_initialize :default_values
  before_save :default_values
  belongs_to :role
  validates :login, uniqueness: true

  def password=(raw)
    self.password_digest = BCrypt::Password.create(raw)
  end

  def password
    self.password_digest
  end

  def is_password?(raw)
    BCrypt::Password.new(password_digest).is_password?(raw)
  end

  private
  def default_values
    self.role_id ||= 2
  end
end
