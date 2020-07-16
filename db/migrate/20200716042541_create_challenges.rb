class CreateChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :challenges do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.date :time
      t.integer :points

      t.timestamps
    end
  end
end
