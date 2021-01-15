class AddBillToTrLoans < ActiveRecord::Migration[5.2]
  def change
    add_column :tr_loans, :bill, :string
  end
end
