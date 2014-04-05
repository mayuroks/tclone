class CreateTweetsHashtags < ActiveRecord::Migration
  def change
    create_table :tweets_hashtags, :id => false do |t|
      t.references :tweet
      t.references :hashtag
    end
  end
  def self.down
    drop_table :tweets_hashtags
  end
end
