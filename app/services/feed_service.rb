require "open-uri"

class FeedService
  def initialize(feed)
    @feed = feed
  end

  def fetch_and_update_items
    parsed_feed = Feedjira.parse(URI.open(@feed.url).read)

    update_feed_info(parsed_feed)
    update_feed_items(parsed_feed)
  end

  private

  def update_feed_info(parsed_feed)
    @feed.update(
      name: parsed_feed.title || @feed.name
    ) if parsed_feed.title.present?
  end

  def update_feed_items(parsed_feed)
    parsed_feed.entries.each do |entry|
      next if @feed.feed_items.exists?(url: entry.url) ||
              @feed.feed_items.exists?(guid: entry.id)

      @feed.feed_items.create(
        title: entry.title,
        content: entry.summary || entry.content,
        url: entry.url,
        guid: entry.id,
        published_at: entry.published,
        auther: entry.author,
        read: false
      )
    end
  end
end
