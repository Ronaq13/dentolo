class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :datetime, null: false
      t.string :title, null: false
      t.string :source

      t.timestamps
    end
  end
end
