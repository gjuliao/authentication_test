class Room < ApplicationRecord
    broadcasts_to -> (room){ :rooms_list }, inserts_by: :prepend
    validates :name, presence: true
    has_many :messages

    # after_commit -> { broadcast_prepend_to :rooms_list, target: "rooms_list", partial: "rooms/room", locals: { room: self }, inserts_by: :prepend }, on: :create
end
