class Room < ApplicationRecord
    validates :name, presence: true
    has_many :messages

    broadcasts_to -> (room){ :rooms_list }
end
