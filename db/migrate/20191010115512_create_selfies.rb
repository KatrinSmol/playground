class CreateSelfies < ActiveRecord::Migration[6.0]
  def change
    create_table :selfies do |t|
      t.integer :student_id
      t.string :image

      t.timestamps
    end
  end
end
