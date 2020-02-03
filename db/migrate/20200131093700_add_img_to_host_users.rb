class AddImgToHostUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :host_users, :image, :string
  end
end
