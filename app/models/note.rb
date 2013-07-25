class Note < ActiveRecord::Base
  
  belongs_to :notepad

  validates :notepad_id, presence: true

  def user
  	notepad.user
  end
end
