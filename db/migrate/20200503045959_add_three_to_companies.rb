class AddThreeToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :eiri_ritu, :float
    add_column :companies, :goukei_rimawari, :float
    add_column :companies, :wariyasudo, :float
  end
end
