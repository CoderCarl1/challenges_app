class AddCountToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_count, :integer
  end
end
