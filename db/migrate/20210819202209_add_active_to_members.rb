class AddActiveToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :active_member, :boolean, :default => true
  end
end
