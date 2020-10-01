class CreateTrLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :tr_loans do |t|
      t.string :member_name, limit: 100
      t.string :member_phone, limit: 13
      t.string :member_email, limit: 50
      t.integer :ms_book_id
      t.boolean :is_active, default:true

      t.timestamps
    end
  end
end
