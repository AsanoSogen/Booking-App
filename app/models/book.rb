class Book < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :host_user
    has_many :resevations
    validates :title, presence: true, unless: :image?
    
end
