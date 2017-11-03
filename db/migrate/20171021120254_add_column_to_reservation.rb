class AddColumnToReservation < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :reservation_time, :time
    add_column :reservations, :reservation_message, :text
  end
end
