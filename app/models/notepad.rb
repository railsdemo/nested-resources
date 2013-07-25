class Notepad < ActiveRecord::Base
  
  belongs_to :user
  has_many :notes, dependent: :destroy

  validates :user_id, presence: true
end
