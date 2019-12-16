class AddColumnItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :detail, :text, null: false
    add_column    :items, :description, :text, null: false
  end
end
