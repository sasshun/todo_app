class CreateTaskTimes < ActiveRecord::Migration[7.1]
  def change
    create_table :task_times do |t|
      t.references :task, foreign_key: true
      t.datetime :started_at
      t.datetime :ended_at
      t.timestamps
    end
  end
end
