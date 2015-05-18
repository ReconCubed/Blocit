class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
      t.string :title, null: false, default: ''
      t.text :copy, null: false, default: ''
      t.integer :price, null: false, default: 0

      t.timestamps
    end
  end
end
