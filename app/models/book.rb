class Book < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :host_user
    has_many :reservations
    has_many :user, through: :users
    validates :title, presence: true, unless: :image?
    
end
