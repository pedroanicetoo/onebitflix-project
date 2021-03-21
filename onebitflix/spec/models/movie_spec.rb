require 'rails_helper'

RSpec.describe Movie, type: :model do
  let!(:serie) { FactoryBot.create(:serie) }
  let!(:movie) { FactoryBot.create(:movie) }
  subject { movie }
  describe "relations" do
    it { should belong_to(:serie).optional }
    it { should belong_to(:category).optional }
    it { should have_many(:reviews) }
    it { should have_many(:players) }
    it { should have_one(:watched_serie) }
  end
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:featured_thumbnail_key) }
    it { should validate_presence_of(:video_key) }
    context "serie present" do
      before :each do
        subject.update_columns(serie_id: serie.id, episode_number: rand(20))
      end
      it { expect(subject).to validate_uniqueness_of(:episode_number).scoped_to(:serie_id) }
      context "highlight is true" do
        it 'highlight_episode validate and should return errors' do
          subject.update_column(:highlighted, true)
          subject.validate
          expect(subject.errors[:highlight_episode]).to include("It's not possible to highlight an serie episode")
        end        
      end
      context "highlight is not true" do
        it 'highlight_episode validate and shouldnt return errors' do
          subject.validate
          expect(subject.errors[:highlight_episode]).to_not include("It's not possible to highlight an serie episode")
        end        
      end
    end
    it { should validate_presence_of(:category_id) }
    it 'highlight_episode validate and shouldnt return errors' do
      subject.validate
      expect(subject.errors[:highlight_episode]).to_not include("It's not possible to highlight an serie episode")
    end        
  end
end
