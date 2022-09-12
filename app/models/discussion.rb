class Discussion < ApplicationRecord
  belongs_to :channel
  belongs_to :user
  has_many :replies, dependent: :destroy

  validates :title, presence true
  validates :content, presence true
end
