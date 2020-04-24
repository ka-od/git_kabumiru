class RemoveHaitouRimawariFromCompanies < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :Haitou_rimawari, :float
  end
end
