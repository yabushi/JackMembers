class CreateBands < ActiveRecord::Migration[6.0]
  def change
    create_table :bands do |t|
      t.text :bandname
      t.text :members
      t.integer :teien
      t.integer :gakunai
      t.text :notes

      t.timestamps
    end
  end
end
