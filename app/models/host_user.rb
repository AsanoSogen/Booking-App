class HostUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books

         
  mount_uploader :image, ImageUploader

  def self.search(search)
    HostUser.where('name LIKE(?)', "%#{search}%")
  end

end

