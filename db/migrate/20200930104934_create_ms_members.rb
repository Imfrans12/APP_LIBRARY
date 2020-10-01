class CreateMsMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :ms_members do |t|
      t.string :name, limit: 100
      t.integer :age
      t.text :address
      t.string :phone, limit: 13
      t.string :email, limit: 50
      t.boolean :is_active, default:true

      t.timestamps
    end
  end
end
