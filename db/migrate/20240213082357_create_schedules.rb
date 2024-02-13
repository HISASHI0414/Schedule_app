class CreateSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :schedules do |t|
      t.string :title, null: false
      t.date :started_at, null: false
      t.date :finished_at, null: false
      t.boolean :alarm, default: false, null: false
      t.text :url
      t.timestamps
    end
  end
end
