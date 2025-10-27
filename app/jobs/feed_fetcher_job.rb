class FeedFetcherJob < ApplicationJob
  queue_as :default

  def perform(feed_id = nil)
    if feed_id
      feed = Feed.find(feed_id)
      FeedService.new(feed).fetch_and_update_items
    else
      Feed.find_each do |feed|
        FeedService.new(feed).fetch_and_update_items
      rescue StandardError => e
        Rails.logger.error "Erro ao atualizar feed #{feed.id}: #{e.message}"
      end
    end
  end
end