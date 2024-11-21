class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :coins
      t.references :user

      t.timestamps
    end
  end
end
