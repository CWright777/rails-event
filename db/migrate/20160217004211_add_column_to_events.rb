class AddColumnToEvents < ActiveRecord::Migration
  def change
    add_column :events, :date, :DATE
  end
end
