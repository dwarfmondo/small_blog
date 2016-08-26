class User < ApplicationRecord
  has_many :blogs

  has_secure_password

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save :downcase_email

  validates :name,      presence: true
  validates :email,     presence: true,
                        uniqueness: { case_sensitive: false },
                        format: { with: EMAIL_REGEX }
  validates :password,  length: { minimum: 7 },
                        allow_nil: true

  private

  def downcase_email
    self.email = email.downcase
  end
end
