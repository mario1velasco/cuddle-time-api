class CreateInitialTables < ActiveRecord::Migration[5.2]
  def up
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :telephone
      t.string :alias

      t.timestamps
    end

    create_table :time_tables do |t|
      t.integer :day
      t.integer :start_time
      t.integer :end_time

      t.timestamps
    end

    create_table :assignments do |t|
      t.belongs_to :user, index: true
      t.belongs_to :time_table, index: true
      t.timestamps
    end
  end

  def down
    drop_table "users"
    drop_table "time_tables"
    drop_table "assignments"
  end
end
