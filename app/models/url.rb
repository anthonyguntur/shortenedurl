class Url < ActiveRecord::Base
  has_many :requestLogs
  validates :original_url, presence: true
end