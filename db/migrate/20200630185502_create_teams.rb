class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.references :user, foreign_key: true
      t.string :members, array: true

      t.timestamps
    end
  end
end
