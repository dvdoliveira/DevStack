class DropDelayedTable < ActiveRecord::Migration
  def change
    drop_table :delayed_jobs
  end
end
