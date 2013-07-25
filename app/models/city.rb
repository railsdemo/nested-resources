class City < ActiveRecord::Base
  
  belongs_to :state

  validates :state_id, presence: true

  def country
  	state.country
  end
end
