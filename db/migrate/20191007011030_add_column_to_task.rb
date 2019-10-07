class AddColumnToTask < ActiveRecord::Migration[5.2]
  def change
    change_column_null :tasks, :end_time, null: false
    change_column :tasks, :end_time, :date, default: '2019-12-31'
  end
end
