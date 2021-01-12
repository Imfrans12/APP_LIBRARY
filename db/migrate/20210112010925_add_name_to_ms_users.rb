class AddNameToMsUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :ms_users, :name, :string
  end
end
