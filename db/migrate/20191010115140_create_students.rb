class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :facebook
      t.string :instagram
      t.string :vkontakte
      t.string :youtube
      t.string :hse_portfolio

      t.timestamps
    end
  end
end
