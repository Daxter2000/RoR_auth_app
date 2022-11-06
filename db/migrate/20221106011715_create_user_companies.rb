class CreateUserCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :user_companies do |t|
      t.references :user, :foreign_key => {on_update: :cascade, on_delete: :cascade}
      t.references :company, :foreign_key => {on_update: :cascade, on_delete: :cascade}
      t.timestamps
    end
  end
end
