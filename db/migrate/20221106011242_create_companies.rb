class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name, :null => false, limit: 255
      t.string :RFC, :null => true
      t.string :address, :null => false                                        

      t.timestamps
    end
  end
end
