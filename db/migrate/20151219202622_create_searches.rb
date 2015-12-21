class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.references :user, null: false
      t.string :text
      t.timestamps null: false
    end
  end
end
