class Post < ApplicationRecord
  belongs_to :user
  has_many :komentars
  validates :user_id, presence: true
  #validates :content, presence: true, length: { maximum: 140 } #tweets are capped at 140 chars.
  validates :content, presence: true
  default_scope -> { order(created_at: :desc) } #newest tweets / posts first
end
