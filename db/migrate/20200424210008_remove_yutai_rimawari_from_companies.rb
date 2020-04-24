class RemoveYutaiRimawariFromCompanies < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :Yutai_rimawari, :float
  end
end
