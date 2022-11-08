class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :names
      t.string :ap_pat
      t.string :ap_mat
      t.string :telefono
      t.string :canal
      t.string :calle
      t.string :colonia
      t.string :numero
      t.string :referencias
      t.string :notas
      t.references :company, :foreign_key => {on_update: :cascade, on_delete: :cascade}, null: false

      t.timestamps
    end
  end
end
