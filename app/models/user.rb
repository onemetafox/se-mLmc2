class User < ApplicationRecord
  has_secure_password

  has_many :task
  has_many :calendar
  has_many :group
  has_many :calendar
end
