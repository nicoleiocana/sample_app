class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :micropost
  validates :tag_id, uniqueness: { scope: :micropost_id }
end
