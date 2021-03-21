require 'rails_helper'

RSpec.describe Player, type: :model do
  let(:movie) { FactoryBot.create(:movie) }
  let(:user) { FactoryBot.create(:user) }
  describe "relations" do
    it { should belong_to(:movie) }
    it { should belong_to(:user) }
  end

  describe "#set_start_date" do
    let(:player) { Player.new(movie_id: movie.id, user_id: user.id) }
    subject { player.save }
    it "should set start date before_create" do
      expect{ subject }.to change{ player.start_date }
    end
  end

end
