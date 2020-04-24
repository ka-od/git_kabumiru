class RemoveRiekiFromCompanies < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :jun_rieki, :float
    remove_column :companies, :hitokabu_rieki, :float
  end
end
