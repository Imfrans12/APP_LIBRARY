class CreateMsBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :ms_books do |t|
      t.string :name, limit: 250
      t.integer :ms_publisher_id
      t.boolean :is_active, default:true

      t.timestamps
    end
  end
end
