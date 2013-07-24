class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :content
      t.string :name
      t.integer :notepad_id

      t.timestamps
    end
  end
end
