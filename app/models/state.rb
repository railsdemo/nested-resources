class State < ActiveRecord::Base
  
  belongs_to :country
  has_many :cities, dependent: :destroy

  validates :country_id, presence: true
end
