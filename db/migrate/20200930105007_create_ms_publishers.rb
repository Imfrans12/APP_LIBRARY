class CreateMsPublishers < ActiveRecord::Migration[5.2]
  def change
    create_table :ms_publishers do |t|
      t.string :name, limit: 100
      t.string :phone, limit: 13
      t.text :address
      t.boolean :is_active, default:true

      t.timestamps
    end
  end
end
