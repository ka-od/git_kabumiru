class RemoveYutaiFromCompanies < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :Yutai, :float
  end
end
