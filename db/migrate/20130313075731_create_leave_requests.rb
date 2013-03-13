class CreateLeaveRequests < ActiveRecord::Migration
  def change
    create_table :leave_requests do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :appover_id
      t.integer :leave_type_id
      t.boolean :is_approved
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
