class CreateTestModels < ActiveRecord::Migration
  def change
    create_table :test_models do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
