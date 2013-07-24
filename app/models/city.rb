class City < ActiveRecord::Base
  attr_accessible :name, :state_id

  belongs_to :state

  validates :state_id, presence: true

  def country
  	state.country
  end
end
