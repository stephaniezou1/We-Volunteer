class Tasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :organization_id
      t.string :name
      t.string :requirements
      t.text :content
    end
  end
end
