class AddNicknameAndAvatarToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nickname, :string, null: false, unique: true
    add_column :users, :avatar, :text
  end
end
