require 'active_support'
require 'active_support/core_ext/numeric/conversions'

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

  def average_cost_of_player
    "$" + (details["total_value"] / details["player_count"]).to_s(:delimited)
  end

  def players_by_last_name
    player_list = []
    roster.each do |player|
      player_list << player.last_name 
    end
    player_list.sort.join(", ")
  end
end