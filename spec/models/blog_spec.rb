require 'rails_helper'

RSpec.describe Blog, type: :model do
  describe "Validations" do
    context "on a new blog" do
      it "is valid" do
        user = build(:user)
        blog = build(:blog)

        blog.user = user

        expect(blog).to be_valid
      end

      it "is invalid without a name" do
        blog = build(:blog_with_user, name: nil)

        expect(blog).to be_invalid
      end

      it "is invalid without a slug" do
        blog = build(:blog_with_user, name: nil)

        expect(blog).to be_invalid
      end

      it "is invalid with a short slug" do
        blog = build(:blog_with_user, slug: 'aa')

        expect(blog).to be_invalid
      end

      it "is invalid with a long slug" do
        blog = build(:blog_with_user, slug: 'a'*31)

        expect(blog).to be_invalid
      end

      it "rejects an invalid slug" do
        blog = build(:blog_with_user, slug: 'aa*')

        expect(blog).to be_invalid
      end

      it "rejects a duplicate email address" do
        blog = create(:blog_with_user, name: 'This Is A Blog', slug: 'this-is-a-slug')
        dup_blog = blog.dup

        expect(dup_blog).to be_invalid
      end

      it "ensures slugs are parameterized" do
        slug = 'This-Is-A-Slug'
        blog = create(:blog_with_user, name: 'This Is A Blog', slug: slug)

        expect(slug.parameterize).to eq(blog.reload.slug)
      end
    end
  end
end
