class AddDurationToTrLoans < ActiveRecord::Migration[5.2]
  def change
    add_column :tr_loans, :duration, :string
  end
end
