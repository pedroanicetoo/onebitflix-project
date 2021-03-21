require 'rails_helper'

RSpec.describe Category, type: :model do
  let!(:category) { FactoryBot.create(:category) }
  subject { category }

  describe "relations" do
    it { should have_many(:movies) }
    it { should have_many(:series) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

end
