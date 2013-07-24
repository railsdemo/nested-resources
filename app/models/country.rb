class Country < ActiveRecord::Base
  attr_accessible :name

  has_many :states, dependent: :destroy
  has_many :cities, through: :states, dependent: :destroy
end
