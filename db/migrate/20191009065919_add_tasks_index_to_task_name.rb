class AddTasksIndexToTaskName < ActiveRecord::Migration[5.2]
  def up
    add_index :tasks, [:task_name, :status]
  end
end
