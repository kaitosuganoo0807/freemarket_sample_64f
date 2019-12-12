class RemoveColumnUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :card_number, :integer
    remove_column :users, :expiration_month, :integer
    remove_column :users, :expiration_year, :integer
    remove_column :users, :security_code, :integer
    remove_column :users, :icon, :string
    remove_column :users, :introduction, :text
    remove_column :users, :birth_year, :integer
    remove_column :users, :birth_month, :integer
    remove_column :users, :birth_day, :integer
  end
end
