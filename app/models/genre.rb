class Genre < ApplicationRecord
  belongs_to :user, optional: true
  has_many :contents
  has_many :details
end
