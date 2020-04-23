class AddJikoshihonRitsuToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :jikoshihon_ritsu, :float
  end
end
