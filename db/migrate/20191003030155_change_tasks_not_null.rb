class ChangeTasksNotNull < ActiveRecord::Migration[5.2]
  def change
    def up
    change_column :tasks, :task_name, :string, limit: 30, null: false
    change_column :tasks, :memo, :text, null:false
    end

    def down
      change_column :tasks, :task_name, :string
    end

  end
end
