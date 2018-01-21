class AddItemToOnboard < ActiveRecord::Migration[5.1]
  def change
    add_column :onboards, :item, :string
  end
end
