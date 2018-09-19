class Postsub < ApplicationRecord
  validates :post_id, :sub_id, presence: true

  belongs_to :post
  belongs_to :subreddit,
  foreign_key: :sub_id,
  class_name: :Sub
end
