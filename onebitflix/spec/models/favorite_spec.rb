require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let(:favorite) { FactoryBot.create(:favorite) }
  subject { favorite }

  describe"relations" do
    it { should belong_to(:favoritable) }
    it { should belong_to(:user) }
  end
 
  describe "validations" do
    it { expect(subject).to validate_uniqueness_of(:user_id).scoped_to(:favoritable_type, :favoritable_id).with_message("can favorite only one time per resource") }
  end
  
end
