class CreateInterestUsers < ActiveRecord::Migration
  def change
    create_table :interest_users do |t|
      t.integer :user_id
      t.integer :t_user_id

      t.timestamps
    end
  end
end
