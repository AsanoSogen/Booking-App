class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.datetime :start_dt
      t.datetime :end_dt

      t.timestamps
    end
  end
end
