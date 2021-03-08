class CreateSurgeries < ActiveRecord::Migration[5.2]
  def change
    create_table :surgeries do |t|
      t.string :title
      t.string :weekday
      t.integer :or_number
      t.timestamps
    end
  end
end
