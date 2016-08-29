class Post < ApplicationRecord
  belongs_to :blog

  validates :title, presence: true
  validates :content, presence: true

  scope :latest, -> { order('created_at DESC').first }
end
