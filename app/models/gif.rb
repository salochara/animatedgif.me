class Gif < ApplicationRecord
  include ImageUploader::Attachment(:image)

  belongs_to :user

  acts_as_taggable

  # Cool tip
  scope :sorted, -> { order(created_at: :desc) }

  validates :image_data, presence: true
  validate :has_at_least_one_tag # validate (no s) because it's my own method

  def has_at_least_one_tag
    if tag_list.size < 1
      errors.add(:tag_list, "must have at least one tag")
    end
  end

  def self.random
    order("RANDOM()").first
  end
end
