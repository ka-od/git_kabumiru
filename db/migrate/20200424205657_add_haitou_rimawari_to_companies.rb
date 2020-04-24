class AddHaitouRimawariToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :Haitou_rimawari, :float
  end
end
