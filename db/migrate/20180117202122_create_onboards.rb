class CreateOnboards < ActiveRecord::Migration[5.1]
  def change
    create_table :onboards do |t|

      t.timestamps
    end
  end
end
