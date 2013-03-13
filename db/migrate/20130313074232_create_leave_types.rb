class CreateLeaveTypes < ActiveRecord::Migration
  def change
    create_table :leave_types do |t|
      t.text :name
      t.float :cost

      t.timestamps
    end
  end
end
