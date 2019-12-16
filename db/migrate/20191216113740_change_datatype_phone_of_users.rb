class ChangeDatatypePhoneOfUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :phone, :string, null: false, unique: true
  end
end
