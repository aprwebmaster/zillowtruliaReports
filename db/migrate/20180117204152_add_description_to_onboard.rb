class AddDescriptionToOnboard < ActiveRecord::Migration[5.1]
  def change
    add_column :onboards, :description, :string
  end
end
