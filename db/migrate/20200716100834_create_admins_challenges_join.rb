class CreateAdminsChallengesJoin < ActiveRecord::Migration[6.0]

  def change
    create_table :admins_challenges, id: false  do |t|
      t.integer "admin_id"
      t.integer "challenge_id"
    end
    add_index :admins_challenges, ["admin_id", "challenge_id"]
  end

end
