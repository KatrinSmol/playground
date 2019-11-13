class CreateMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :memberships do |t|
      t.integer :student_id
      t.integer :group_id
      t.datetime :start_date
      t.datetime :end_date
      t.string :reason

      t.timestamps
    end
  end
end
