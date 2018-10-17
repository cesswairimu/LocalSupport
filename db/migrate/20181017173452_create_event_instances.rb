class CreateEventInstances < ActiveRecord::Migration[5.1]
  def change
    create_table :event_instances do |t|

      t.timestamps
    end
  end
end
