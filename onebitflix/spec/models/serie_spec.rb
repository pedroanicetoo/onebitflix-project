require 'rails_helper'

RSpec.describe Serie, type: :model do
  describe "relations" do
    it { should belong_to(:category) }
    it { should have_many(:reviews) }
    it { should have_many(:episodes).order(:episode_number) }
    it { should belong_to(:last_watched_episode).optional }
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:thumbnail_key) }       
  end

end
