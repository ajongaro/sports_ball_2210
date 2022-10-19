class Player
  attr_reader :first_name,
              :last_name,
              :monthly_cost,
              :contract_length,
              :total_cost,
              :nickname

  def initialize(name, monthly_cost, contract_length)
    @name = name.split(" ")
    @first_name = @name.first 
    @last_name = @name.last
    @monthly_cost = monthly_cost 
    @contract_length = contract_length
    @total_cost = monthly_cost * contract_length
    @nickname = nil
  end

  def set_nickname!(nickname)
    @nickname = nickname
  end
end