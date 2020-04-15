class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string            :name
      t.string            :code
      t.float             :kabuka
      t.float             :haitou
      t.float             :yuutai
      t.float             :uriagedaka
      t.float             :eigyou_rieki
      t.timestamps
    end
  end
end
