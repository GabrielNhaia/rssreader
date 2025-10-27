class FeedItem < ApplicationRecord
  belongs_to :feed

  validates :title, presence: true
  validates :url, presence: true, uniqueness: true
  validates :guid, presence: true, uniqueness: { scope: :feed_id }

  scope :unread, -> { where(read: false) }
  scope :recent, -> { order(published_at: :desc) }

  def marked_as_read!
    update!(read: true)
  end
end
