class Detail < ApplicationRecord
    belongs_to :user
    validates :welcome, length: {maximum: 1000}
    validates :aboutMe, length: {maximum: 1000}
    validates :profile, length: {maximum: 1000}
    validates :user_id, presence: true
end
