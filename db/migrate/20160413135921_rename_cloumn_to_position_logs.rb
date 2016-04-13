class RenameCloumnToPositionLogs < ActiveRecord::Migration
  def change
    # change_table
    rename_column :position_system_logs, :lat, :lngs
    rename_column :position_system_logs, :lng, :lat
    rename_column :position_system_logs, :lngs, :lng
  end
end
