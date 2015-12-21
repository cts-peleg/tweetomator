class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :search, null: false
      t.string :screen_name, null: false
      t.string :text, null: false
      t.string :profile_image_url, null: false
      t.datetime :tweet_published, null: false
      t.timestamps null: false
    end
  end
end
