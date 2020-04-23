class RemoveJikoshihonritsuFromCompanies < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :jikoshihonritsu, :float
  end
end
