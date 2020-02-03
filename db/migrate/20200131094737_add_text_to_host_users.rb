class AddTextToHostUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :host_users, :text, :text
  end
end
