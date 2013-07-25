class User < ActiveRecord::Base
  
  has_many :notepads, dependent: :destroy
  has_many :notes, through: :notepads, dependent: :destroy
end
