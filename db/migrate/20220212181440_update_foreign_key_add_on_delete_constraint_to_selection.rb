class UpdateForeignKeyAddOnDeleteConstraintToSelection < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :selections, :teams
    add_foreign_key :selections, :teams, on_delete: :cascade
  end
end
