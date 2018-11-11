class CreateUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :urls do |t|
      t.string :original_url
      t.string :shorten_url
      t.string :shortcode
    end
  end
end
