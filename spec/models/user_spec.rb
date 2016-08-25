require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    context "on a new user" do
      it "is valid" do
        user = create(:user)

        expect(user).to be_valid
      end

      it "is invalid without a name" do
        user = build(:user, name: nil)

        expect(user).to be_invalid
      end

      it "is invalid without an email" do
        user = build(:user, email: nil)

        expect(user).to be_invalid
      end

      it "is invalid without a password" do
        user = build(:user, password: nil)

        expect(user).to be_invalid
      end

      it "is invalid when there's a password mismatch" do
        user = build(:user, password: 'P@ssw0rd', password_confirmation: 'Passw0rd')

        expect(user).to be_invalid
      end

      it "is invalid with a short password" do
        user = build(:user, password: 'short', password_confirmation: 'short')

        expect(user).to be_invalid
      end

      it "accepts a valid email address" do
        user = build(:user, email: 'tim.cook@apple.com')

        expect(user).to be_valid
      end

      it "rejects an invalid email address" do
        user = build(:user, email: 'tim.cook@applecom')

        expect(user).to be_invalid
      end

      it "rejects a duplicate email address" do
        user = create(:user)
        dup_user = user.dup

        expect(dup_user).to be_invalid
      end

      it "ensures email addresses are saved as lowercase" do
        email = 'Johnny.Appleseed@apple.com'
        user = build(:user)
        user.email = email
        user.save

        expect(email.downcase).to eq(user.reload.email)
      end
    end
  end
end
