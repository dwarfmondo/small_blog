class Blog < ApplicationRecord
  belongs_to :user

  SLUG_REGEX = /\A[A-Za-z0-9-]+\z/

  before_save :parameterize_slug

  validates :name,  presence: true
  validates :slug,  presence: true,
                    uniqueness: {
                      case_sensitive: false,
                      scope: :user_id
                    },
                    length: { within: 3..30 },
                    format: {
                      with: SLUG_REGEX,
                      message: ' can only contain alphanumeric characters and dashes'
                    }

  private

  def parameterize_slug
    self.slug = slug.parameterize
  end
end
