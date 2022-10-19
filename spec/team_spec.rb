require './lib/player'
require './lib/team'

RSpec.describe Team do
  # players
  let(:player_1) { Player.new("Michael Pallendorous", 1000000, 36) }
  let(:player_2) { Player.new("Kenny DeNunez", 500000, 24) }
  let(:player_3) { Player.new("Alan McClennan", 750000, 48) }
  let(:player_4) { Player.new("Hamilton Porter", 100000, 12) }
  # team
  let(:team) { Team.new("Dodgers", "Los Angeles") }

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

    # integration test with add_player
    it 'counts players after players are added' do
      team.add_player(player_1)
      team.add_player(player_2)

      expect(team.player_count).to eq(2)
    end
    
  end

  describe '#add_player' do
    it 'adds a player to the roster array' do
      team.add_player(player_1)
      
      expect(team.roster.first).to eq(player_1)

      team.add_player(player_2)
      expect(team.roster[1]).to eq(player_2)
    end
  end

  describe '#long_term_players'
    it 'returns players with contract greater than 24 months' do
      team.add_player(player_1)
      team.add_player(player_2)
      team.add_player(player_3)
      team.add_player(player_4)

      expect(team.long_term_players).to eq([player_1, player_3])
    end
end