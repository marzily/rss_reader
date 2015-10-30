class Article < ActiveRecord::Base
  belongs_to :user

  validates :title, :url, :user_id, presence: true
end
