class FeedsController < ApplicationController
    before_action :set_feed, only: [:show, :edit, :update, :destroy, :mark_all_as_read]

    def index
        @feeds = Feed.includes(:feed_items).order(:category, :name)
        @unread_count = FeedItem.unread.count
        @categories = @feeds.pluck(:category).uniq
    end

    def show
        @feed_items = @feed.feed_items.recent
    end

    def new
        @feed = Feed.new
    end

    def create
        @feed = Feed.new(feed_params)
        if @feed.save
            FeedService.new(@feed).fetch_and_update_items
            FeedFetcherJob.perform_later(@feed.id)
            redirect_to feeds_path, notice: 'Feed criado com sucesso. Os itens estão sendo carregados.'
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @feed = Feed.find(params[:id])
    end

    def update
        if @feed.update(feed_params)
            redirect_to feeds_path, notice: 'Feed atualizado com sucesso.'
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @feed.destroy
        redirect_to feeds_path, notice: 'Feed excluído com sucesso.'
    end

    def refresh
        FeedFetcherJob.perform_later
        redirect_to feeds_path, notice: 'Atualização de feeds iniciada.'
    end

    def mark_all_as_read
        @feed.feed_items.unread.find_each do |item|
            item.marked_as_read!
        end
        redirect_to feed_path(@feed), notice: 'Todos os itens marcados como lidos.'
    end

    private

    def set_feed
        @feed = Feed.find(params[:id])
    end
    def feed_params
        params.require(:feed).permit(:name, :url, :category)
    end
end