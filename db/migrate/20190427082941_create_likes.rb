class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|

      t.references :user, null: false, foreign_key: true, index: true
      t.references :coordinate, null: false, foreign_key: true, index: true
      
      t.timestamps
    end
  end
end
