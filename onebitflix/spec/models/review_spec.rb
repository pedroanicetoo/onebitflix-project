require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:review) { FactoryBot.create(:review) }
  subject { review }

  describe "relations" do
    it { should belong_to(:reviewable) }
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_presence_of(:rating) }
    it { should validate_numericality_of(:rating).is_greater_than(0).is_less_than_or_equal_to(5) }
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:description).is_at_least(50) }    
    it { expect(subject).to validate_uniqueness_of(:user_id).scoped_to(:reviewable_type, :reviewable_id).with_message("can add only one review per resource") }
  end

end
