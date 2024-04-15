class DirectionsPoro
  attr_reader :distance, :travel_time, :maneuvers
  def initialize(attrs)
    attr_adjusted = attrs[:route]
    @distance = format_distance(attr_adjusted[:distance]) #format("%.1f miles", attr_adjusted[:distance])
    @travel_time = attr_adjusted[:formattedTime]
    @maneuvers = attr_adjusted[:legs].first[:maneuvers].map { |maneuver|  maneuver[:narrative] }
    # require 'pry'; binding.pry
  end
  #maneuver[:narrative] = this is what we take out of the maneuvers key thats an 
  #array filled with hashes and then only thing that we 
  #are extracting from that hash is the :narrative key because thats what  
  private

  def format_distance(distance)
    "%.1f miles" % distance
  end

  # def extract_maneuvers(maneuvers)
  #   maneuvers.map { |maneuver| maneuver[:narrative] }
  # end
end