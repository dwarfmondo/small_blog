require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Validations" do
    context "on a new post" do
      it "is valid" do
        blog = build(:blog_with_user)
        post = build(:post)

        post.blog = blog

        expect(post).to be_valid
      end

      it "is invalid without a title" do
        post = build(:post, title: nil)

        expect(post).to be_invalid
      end

      it "is invalid without content" do
        post = build(:post, content: nil)

        expect(post).to be_invalid
      end
    end
  end
end
