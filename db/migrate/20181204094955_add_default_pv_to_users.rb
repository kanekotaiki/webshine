class AddDefaultPvToUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :pv, :integer, default: "0"
  end
end
