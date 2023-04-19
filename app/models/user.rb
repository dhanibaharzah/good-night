class User < ApplicationRecord
  has_many :sleep_records
  has_many :friends
end
