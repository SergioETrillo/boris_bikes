class Van
	DEFAULT_CAPACITY = 2

  attr_reader :broken_bikes

  def initialize
  	@broken_bikes = []
  end

  def collect_broken_bikes(station)
    @broken_bikes = station.select_broken_bikes(remaining_capacity)
  end

  def remaining_capacity
    DEFAULT_CAPACITY - @broken_bikes.length
  end

  def unload
  	delivery = @broken_bikes
  	@broken_bikes = []
  	delivery
  end

end