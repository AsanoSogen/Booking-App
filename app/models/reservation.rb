class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :book
    belongs_to :host_user
end
