class NintendoFriendCode < ApplicationRecord
    belongs_to :user

    validates :friend_code, presence: true, length: {is: 12}, numericality: { only_integer: true }
    validates :user_id, presence: true, uniqueness: true
end
