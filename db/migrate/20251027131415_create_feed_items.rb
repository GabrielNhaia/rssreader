class CreateFeedItems < ActiveRecord::Migration[8.0]
  def change
    create_table :feed_items do |t|
      t.references :feed, null: false, foreign_key: true
      t.string :title
      t.string :url
      t.string :guid
      t.string :content
      t.string :published_at
      t.string :auther
      t.string :read

      t.timestamps
    end
  end
end
