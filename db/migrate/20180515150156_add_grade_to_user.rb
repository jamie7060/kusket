class AddGradeToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :grade, :integer
    add_index :users, :grade, unique: true
  end
end
