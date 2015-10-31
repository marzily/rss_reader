class User < ActiveRecord::Base
  has_secure_password
  has_many :articles

  validates :email, uniqueness: true,
                    format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\z/,
                              message: "Must be a valid email address." }

  validates :password, :password_confirmation, length: { minimum: 8 }

  def starred_urls
    articles.pluck(:id, :url).to_json
  end

  def sorted_articles
    articles.reverse
  end
end
