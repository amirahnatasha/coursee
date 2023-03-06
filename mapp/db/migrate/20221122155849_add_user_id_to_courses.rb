class AddUserIdToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :userID, :integer
    add_column :courses, :username, :string
  end
end
