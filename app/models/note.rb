class Note < ActiveRecord::Base
  attr_accessible :content, :name, :notepad_id
end
