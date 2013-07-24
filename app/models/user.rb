class User < ActiveRecord::Base
  attr_accessible :email, :name

  has_many :notepads, dependent: :destroy
  has_many :notes, through: :notepads, dependent: :destroy
end
