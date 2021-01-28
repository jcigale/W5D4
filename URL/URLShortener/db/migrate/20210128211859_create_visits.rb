class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.integer :url_id, null: false
      t.integer :submitter_id, null: false

      t.timestamps
    end
    add_index :visits, :url_id
    add_index :visits, :submitter_id
  end
end
