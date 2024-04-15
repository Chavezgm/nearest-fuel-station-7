class DirectionsFacade
  def here_to_there(here, there)
    service = MapService.new
    response = service.get_location_a_to_location_b(here, there)
    # require 'pry'; binding.pry
    directions = DirectionsPoro.new(response)
  end
end