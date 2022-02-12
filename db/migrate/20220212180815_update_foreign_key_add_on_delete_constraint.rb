class UpdateForeignKeyAddOnDeleteConstraint < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :members, :teams
    add_foreign_key :members, :teams, on_delete: :cascade
  end
end
