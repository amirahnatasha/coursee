class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.integer :courseID
      t.string :coursename
      t.float :distance
      t.float :time
      t.text :comment
      t.string :imageLink

      t.timestamps
    end
  end
end
