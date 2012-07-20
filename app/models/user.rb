class User < ActiveRecord::Base
  attr_accessible :hashed_password, :name, :salt
end
