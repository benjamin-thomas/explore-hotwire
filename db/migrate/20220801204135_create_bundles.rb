class CreateBundles < ActiveRecord::Migration[7.0]
  def change
    create_table :bundles do |t|
      t.references :quote, null: false, foreign_key: true
      t.date :ship_on, null: false

      t.timestamps
    end

    add_index :bundles, [:quote_id, :ship_on], unique: true
  end
end
