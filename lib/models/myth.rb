class Myth < ActiveRecord::Base
  has_many :user_myths
  has_many :users, through: :user_myth
end
