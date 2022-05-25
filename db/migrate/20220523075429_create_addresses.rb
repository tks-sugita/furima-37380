class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :zip_code,   null: false
      t.integer    :prefecture_id,    null: false
      t.string     :municipality
      t.string     :address_number
      t.string     :building_name
      t.string     :tel_number
      t.references :order,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
