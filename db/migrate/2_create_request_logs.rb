class CreateRequestLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :request_logs do |t|
      t.string :shortcode
      t.text :user_agent
      t.integer :url_id
    end
  end
end
