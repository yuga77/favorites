class Content < ApplicationRecord
  validates :title, presence: true
  belongs_to :genre
end
