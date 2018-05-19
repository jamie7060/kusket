class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|

      t.string :campus
      t.string :haksu
      t.integer :bunban
      t.string :isu_type
      t.string :course_name
      t.string :lecturer
      t.integer :credit
      t.integer :rate

      t.timestamps
    end
  end
end
