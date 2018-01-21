class CreateOnboarddata < ActiveRecord::Migration[5.1]
  def change
    create_table :onboarddata do |t|

      t.timestamps
    end
  end
end
