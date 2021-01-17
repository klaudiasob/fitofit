class CreatePoints < ActiveRecord::Migration[6.1]
  def change
    create_table :points do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.references :activity

      t.timestamps
    end
  end
end
