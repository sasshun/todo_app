class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :content
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
