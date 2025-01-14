require './lib/player'
require './lib/team'

RSpec.describe Team do
  # players
  let(:player_1) { Player.new("Michael Palledorous", 1_000_000, 36) }
  let(:player_2) { Player.new("Kenny DeNunez", 500_000, 24) }
  let(:player_3) { Player.new("Alan McClennan", 750_000, 48) }
  let(:player_4) { Player.new("Hamilton Porter", 100_000, 12) }
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

  describe '#long_term_players' do
    it 'returns players with contract greater than 24 months' do
      team.add_player(player_1)
      team.add_player(player_2)
      team.add_player(player_3)
      team.add_player(player_4)

      expect(team.long_term_players).to eq([player_1, player_3])
    end
  end

  describe '#shorter_term_players' do
    it 'returns players with contract equal to or shorter than 24 months' do
      team.add_player(player_1)
      team.add_player(player_2)
      team.add_player(player_3)
      team.add_player(player_4)
      
      expect(team.short_term_players).to eq([player_2, player_4])
    end
  end

  describe '#total_value' do
    it 'returns sum of monthly cost times contract length for team' do
      team.add_player(player_1)
      team.add_player(player_2)
      team.add_player(player_3)
      team.add_player(player_4)

      expect(team.total_value).to eq(85_200_000)
    end
  end

  describe '#details' do
    it 'returns team details as hash' do
      team.add_player(player_1)
      team.add_player(player_2)
      team.add_player(player_3)
      team.add_player(player_4)

      expect(team.details).to eq({"total_value" => 85_200_000, "player_count" => 4})
    end
  end

  describe '#average_cost_of_player' do
    it 'returns the average cost of a player on team' do
      team.add_player(player_1)
      team.add_player(player_2)
      team.add_player(player_3)
      team.add_player(player_4)
      
      expect(team.average_cost_of_player).to eq("$21,300,000")
    end
  end    

  describe '#players_by_last_name' do
    it 'returns roster of players last names as string' do
      team.add_player(player_1)
      team.add_player(player_2)
      team.add_player(player_3)
      team.add_player(player_4)
      
      expect(team.players_by_last_name).to eq("DeNunez, McClennan, Palledorous, Porter")
    end
  end
end