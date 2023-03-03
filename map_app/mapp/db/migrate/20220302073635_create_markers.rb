class CreateMarkers < ActiveRecord::Migration[5.0]
  def change
    create_table :markers do |t|
      t.string :Title
      t.float :lat
      t.float :lon

      t.timestamps
    end
  end
end
