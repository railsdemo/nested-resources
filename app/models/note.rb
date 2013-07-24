class Note < ActiveRecord::Base
  attr_accessible :content, :name, :notepad_id

  belongs_to :notepad

  validates :notepad_id, presence: true

  def user
  	notepad.user
  end
end
