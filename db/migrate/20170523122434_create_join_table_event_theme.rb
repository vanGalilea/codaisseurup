class CreateJoinTableEventTheme < ActiveRecord::Migration[5.1]
  def change
    create_join_table :events, :themes do |t|
      t.index [:event_id, :theme_id]
      t.index [:theme_id, :event_id]
    end
  end
end
