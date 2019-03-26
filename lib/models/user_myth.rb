class UserMyth < ActiveRecord::Base
  belongs_to :user
  belongs_to :myth
end
