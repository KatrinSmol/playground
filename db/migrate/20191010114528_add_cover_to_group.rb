class AddCoverToGroup < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :cover, :string
  end
end
