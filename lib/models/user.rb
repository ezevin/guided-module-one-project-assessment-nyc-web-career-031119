class User < ActiveRecord::Base
  has_many :user_myths
  has_many :myths, through: :user_myth
end
