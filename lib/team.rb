class Team
  attr_reader :roster

  def initialize(name, city)
    @name = name
    @city = city
    @roster = []
  end

  def player_count
    @roster.size
  end

  def add_player(player)
    @roster << player
  end

  def long_term_players
    @roster.select { |player| player.contract_length > 24 }
  end

  def short_term_players
    @roster.select { |player| player.contract_length <= 24 }
  end

  def total_value
    total = 0
    roster.each do |player|
      total += (player.monthly_cost * player.contract_length)
    end
    total
  end

  def details
    player_details = {}
    player_details["total_value"] = total_value
    player_details["player_count"] = player_count
    player_details
  end
end