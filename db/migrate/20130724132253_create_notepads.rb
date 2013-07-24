class CreateNotepads < ActiveRecord::Migration
  def change
    create_table :notepads do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
