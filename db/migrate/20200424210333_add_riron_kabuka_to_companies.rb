class AddRironKabukaToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :riron_kabuka, :float
  end
end
