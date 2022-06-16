module Query
  class RoverPosition

    def initialize(rover)
      @rover_position = rover
    end

    def display_position
      "#{@rover_position.position[0]} #{@rover_position.position[1]} #{@rover_position.direction}"
    end
  end

end
