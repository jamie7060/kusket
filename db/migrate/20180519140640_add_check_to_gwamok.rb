class AddCheckToGwamok < ActiveRecord::Migration[5.0]
  def change
    add_column :gwamoks, :checkbox, :boolean, default: false
  end
end
