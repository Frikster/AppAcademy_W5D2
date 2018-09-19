class Sub < ApplicationRecord
  validates :title, :description, :mod_id, presence:true

  has_many :posts

  belongs_to :mod,
  foreign_key: :mod_id,
  class_name: :User

  has_many :postsubs,
  foreign_key: :sub_id,
  class_name: :Postsub
end
