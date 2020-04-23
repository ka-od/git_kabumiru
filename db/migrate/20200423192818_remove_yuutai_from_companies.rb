class RemoveYuutaiFromCompanies < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :yuutai, :float
  end
end
