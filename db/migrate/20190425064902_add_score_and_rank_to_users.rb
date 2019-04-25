class AddScoreAndRankToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :rank, :integer, default: 0
    add_column :users, :score, :integer, default: 0
  end
end
