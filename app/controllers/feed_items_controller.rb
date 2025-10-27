class FeedItemsController < ApplicationController
    def index
        @feed_items = FeedItem.recent.includes(:feed).order(created_at: :desc)

        if params[:category].present?
            @feed_items = @feed_items.joins(:feed).where(feeds: { category: params[:category] })
        end

        if params[:unread] == 'true'
            @feed_items = @feed_items.unread
        end

        if @feed_items.respond_to?(:page)
          @feed_items = @feed_items.page(params[:page]).per(20)
        end

        @categories = Feed.pluck(:category).uniq
    end

    def show
        @feed_item = FeedItem.find(params[:id])
        @feed_item.marked_as_read! unless @feed_item.read?
        @categories = Feed.pluck(:category).uniq
    end

    def mark_as_read
        @feed_item = FeedItem.find(params[:id])
        @feed_item.marked_as_read!
        redirect_to feed_item_path(@feed_item), notice: 'Item marcado como lido.'
    end

    def mark_all_as_read
        FeedItem.unread.find_each do |item|
            item.marked_as_read!
        end
        redirect_to feed_items_path, notice: 'Todos os itens marcados como lidos.'
    end

    private

    def feed_item_params
        params.require(:feed_item).permit(:title, :content, :url, :guid, :published_at, :author, :read, :feed_id)
    end
end
