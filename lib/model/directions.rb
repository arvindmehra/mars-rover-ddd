require_relative './action'

module Model
  class Directions

    attr_reader :direction

    def initialize(direction)
      @direction = direction
    end

    def facing
      case
        when @direction == 'N'
          Action::NORTH
        when @direction == 'E'
          Action::EAST
        when @direction == 'W'
          Action::WEST
        when @direction == 'S'
          Action::SOUTH
      end
    end

  end
end
