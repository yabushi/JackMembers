class CreateComas < ActiveRecord::Migration[6.0]
  def change
    create_table :comas do |t|
      t.datetime :date
      t.text :term
      t.integer :band_id
      t.text :hitech
      t.boolean :canmod

      t.timestamps
    end
  end
end
