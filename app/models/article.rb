class Article < ActiveRecord::Base
  belongs_to :user

  validates :title, :url, :user_id, presence: true

  def self.new_with_uid(params, user)
    full_params = params.merge(user_id: user.id)
    new(full_params)
  end
end
