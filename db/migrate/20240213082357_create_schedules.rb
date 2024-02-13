class CreateSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :schedules do |t|
      t.references :user, null: false
      t.string :title, null: false
      t.date :start_time, null: false
      t.date :end_time, null: false
      t.boolean :alarm, default: false, null: false
      t.text :url
      t.boolean :schedule_repeated, default: false, null: false
      t.timestamps
    end
  end
end
