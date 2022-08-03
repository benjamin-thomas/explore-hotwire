class CreateBundleItems < ActiveRecord::Migration[7.0]
  def change
    create_table :bundle_items do |t|
      t.references :bundle, null: false, foreign_key: true
      t.string :name, null: false
      t.text :maybe_descr
      t.integer :quantity, null: false
      t.decimal :unit_price, precision: 10, scale: 2, null: false

      t.timestamps
    end
  end
end
