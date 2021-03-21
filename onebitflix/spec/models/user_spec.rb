require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }
  
  describe "ralations" do
    it { should have_many(:reviews) }
    it { should have_many(:favorites) }
    it { should have_many(:players) }
  end

  describe "validations" do
    it { should validate_presence_of(:name).on(:update) }
  end

end
