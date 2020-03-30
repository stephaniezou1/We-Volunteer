class Volunteers < ActiveRecord::Migration[5.2]
  def change
    create_table :volunteers do |t|
      t.string :full_name
    end
  end
end
