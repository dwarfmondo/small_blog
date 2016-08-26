FactoryGirl.define do
  factory :blog do
    name "Signal v. Noise"
    slug "signal-v-noise"
  end

  factory :blog_with_user, class: Blog do
    association :user, factory: :user
  end
end
