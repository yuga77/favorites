class Detail < ApplicationRecord
  belongs_to :genre
  belongs_to :content

  validates :detail, presence: true
  mount_uploader :image, ImageUploader
end
