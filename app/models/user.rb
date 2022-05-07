class User < ApplicationRecord
  belongs_to :role
  validates :login, uniqueness: true
end
