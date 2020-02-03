class RenameImgColumnToHostUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :host_users, :img, :image
  end
end
