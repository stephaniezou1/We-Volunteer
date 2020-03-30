class Assignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.integer :volunteer_id
      t.integer :task_id
    end
  end
end
