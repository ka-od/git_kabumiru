class AddHitokabuRiekiToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :hitokabu_rieki, :float
  end
end
