class AddColumnToTask < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column_null :tasks, :end_time, false, '2019-12-31'
      change_column :tasks, :end_time, :date, default: '2019-12-31'
    end

    def down
      change_column_null :tasks, :end_time, true, nil
      change_column :tasks, :end_time, :date, default: nil
    end
  end
end
