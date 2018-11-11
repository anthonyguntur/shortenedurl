class RequestLog < ActiveRecord::Base
  belongs_to :url
  validates :shortcode, :user_agent, presence: true
end