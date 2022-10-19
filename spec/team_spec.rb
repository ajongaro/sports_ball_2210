require './lib/player'
require './lib/team'

RSpec.describe Team do
  let(:player_1) { Player.new("Michael Pallendorous", 1000000, 36) }
  let(:player_2) { Player.new("Kenny DeNunez", 500000, 24)}
  let(:team) { Team.new("Dodgers", "Los Angeles")}

  describe '#initialize' do
    it 'exists' do
      expect(team).to be_a(Team)
    end
    
    it 'starts with empty roster' do
      expect(team.roster).to eq([])
    end
  end

  describe '#player_count' do
    it 'counts the players on team' do
      expect(team.player_count).to eq(0)
    end
  end
end