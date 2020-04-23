class AddPbrToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :pbr, :float
  end
end
