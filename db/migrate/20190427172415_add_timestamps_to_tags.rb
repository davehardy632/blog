class AddTimestampsToTags < ActiveRecord::Migration[5.1]
  def change
    add_timestamps :tags, null: true
  end
end
