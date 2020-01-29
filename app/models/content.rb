class Content < ApplicationRecord
  validates :title, presence: true
  belongs_to :genre
  has_many :details, dependent: :destroy
end
