class AddcolumntoUser < ActiveRecord::Migration
   def change
    add_column :users, :nickname, :string
    add_column :users, :education_degree, :string
    add_column :users, :job, :string
    add_column :users, :company, :string
    add_column :users, :university, :string
    add_column :users, :location, :string
    add_column :users, :kakaotalk, :string
    add_column :users, :tribe, :string
  end
end
