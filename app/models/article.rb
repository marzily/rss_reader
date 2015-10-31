class Article < ActiveRecord::Base
  belongs_to :user

  validates :title, :url, :user_id, presence: true
  validates :url, uniqueness: { scope: :user_id,
   message: "user already saved this article" }

  def self.new_with_uid(params, user)
    full_params = params.merge(user_id: user.id)
    new(full_params)
  end

  def html_title
    if url[-5..-1] == '.html'
      url.match(/.*\/(.*)\./)[1]
    elsif url[-1] == '/'
      url.match(/.*\/(.*)\//)[1]
    else
      url.match(/.*\/(.*)$/)[1]
    end
  end
end
