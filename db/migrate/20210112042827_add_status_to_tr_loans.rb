class AddStatusToTrLoans < ActiveRecord::Migration[5.2]
  def change
    add_column :tr_loans, :status, :string
  end
end
