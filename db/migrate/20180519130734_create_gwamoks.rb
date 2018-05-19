class CreateGwamoks < ActiveRecord::Migration[5.0]
  def change
    create_table :gwamoks do |t|
      t.string :campus
      t.string :haksu
      t.string :bunban
      t.string :isu_type
      t.string :course_name
      t.string :lecturer
      t.string :credit
      t.integer :rate

      t.timestamps
    end
  end
end
