class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.integer :start_year
      t.integer :end_year
      t.string :codename
      t.string :name

      t.timestamps
    end
  end
end
