module Gravatarable
  extend ActiveSupport::Concern

  BASE_URL = "//secure.gravatar.com/avatar/{{hash}}?s={{size}}&d=identicon&r=g"

  def gravatar_url(size=32)
    hash = Digest::MD5::hexdigest(email.downcase)
    url = BASE_URL.sub("{{hash}}", hash)
    url = url.sub("{{size}}", (size*2).to_s)

    url
  end
end
