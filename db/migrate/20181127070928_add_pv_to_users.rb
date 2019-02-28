class AddPvToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :pv, :integer
  end
end
