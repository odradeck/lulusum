class AddColomnNamePhoneToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :phone, :string
    add_column :users, :gender, :string
    add_column :users, :birth, :datetime
    add_column :users, :address, :string
    add_column :users, :level, :integer
    add_column :users, :point, :integer
    add_column :users, :provider, :string
    add_column :users, :uid, :string
  end
  
end
