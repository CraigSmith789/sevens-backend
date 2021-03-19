class CreateStats < ActiveRecord::Migration[6.1]
  def change
    create_table :stats do |t|
      t.string :name
      t.integer :played
      t.integer :won

      t.timestamps
    end
  end
end
