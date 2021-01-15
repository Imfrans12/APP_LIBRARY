class AddReturnDateToTrLoans < ActiveRecord::Migration[5.2]
  def change
    add_column :tr_loans, :return_date, :date
  end
end
