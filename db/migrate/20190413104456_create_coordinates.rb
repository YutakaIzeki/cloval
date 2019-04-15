class CreateCoordinates < ActiveRecord::Migration[5.0]
  def change
    create_table :coordinates do |t|
      t.references :user, foregn_key: true, index: true
      t.text    :image, null: false
      t.integer :good, default: 0
      t.integer :evaluation_value, default: 0
      t.integer :evaluation_number, default: 0
      t.timestamps
    end
  end
end
