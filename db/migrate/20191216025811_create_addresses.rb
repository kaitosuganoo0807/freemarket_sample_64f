class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|

      t.references :user, foreign_key: true
      t.string :post_code,	null: false
      t.integer	:prefecture, null: false
      t.string	:city,	null: false
      t.string	:street,	null: false
      t.string	:building	
      t.integer :phone	
      t.string	:surname,	null: false
      t.string	:first_name, null: false
      t.string	:surname_kana,	null: false
      t.string	:first_name_kana, null: false

      t.timestamps
    end
  end
end
