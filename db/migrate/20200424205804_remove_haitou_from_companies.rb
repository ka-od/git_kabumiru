class RemoveHaitouFromCompanies < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :Haitou, :float
  end
end
