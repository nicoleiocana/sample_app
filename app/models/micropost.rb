class Micropost < ApplicationRecord
  belongs_to :user
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  
  self.per_page = 20
  
  def self.tagged_with(name)
    Tag.find_by!(name: name).microposts
  end

  def self.tag_counts
    Tag.select("tags.id, tags.name,count(taggings.tag_id) as count").
      joins(:taggings).group("taggings.tag_id, tags.id, tags.name")
  end  

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    tag_names = names.split(',').map { |s| s.delete(" ").downcase }.uniq
    self.tags = tag_names.map { |n| Tag.find_or_create_by(name: n) }
  end
end
