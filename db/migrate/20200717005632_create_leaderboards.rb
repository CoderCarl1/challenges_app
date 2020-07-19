class CreateLeaderboards < ActiveRecord::Migration[6.0]
  def change
    create_table :leaderboards do |t|
      t.string :name
      t.references :challenge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
