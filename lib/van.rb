class Van
	DEFAULT_CAPACITY = 20
		
  attr_reader :broken_bikes

  def initialize
  	@broken_bikes = []
  end

  def collect_broken_bikes(station)
    @broken_bikes = station.select_broken_bikes
  end
end