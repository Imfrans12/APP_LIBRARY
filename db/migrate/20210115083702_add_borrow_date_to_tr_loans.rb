class AddBorrowDateToTrLoans < ActiveRecord::Migration[5.2]
  def change
    add_column :tr_loans, :borrow_date, :date
  end
end
