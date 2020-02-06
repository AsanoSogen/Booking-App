class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :image
      t.text :text
      t.integer :host_user_id
      t.datetime :start_dt, null: false
      t.datetime :end_dt, null: false
      t.timestamps
    end
  end
end
