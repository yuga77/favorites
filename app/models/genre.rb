class Genre < ApplicationRecord
  belongs_to :user
  has_many :contents
  has_many :details
end
