class Feed < ApplicationRecord
    has_many :feed_items, dependent: :destroy

    validates :name, presence: true
    validates :url, presence: true, uniqueness: true
end
