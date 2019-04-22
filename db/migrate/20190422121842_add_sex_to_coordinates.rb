class AddSexToCoordinates < ActiveRecord::Migration[5.0]
  def change
    add_column :coordinates, :sex, :string, null: false
  end
end
