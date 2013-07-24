class Notepad < ActiveRecord::Base
  attr_accessible :name, :user_id

  belongs_to :user
  has_many :notes, dependent: :destroy

  validates :user_id, presence: true
end
