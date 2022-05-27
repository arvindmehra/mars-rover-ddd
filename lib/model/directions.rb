require_relative './constant'

module Model
  class Directions

    attr_reader :direction

    def initialize(direction)
      @direction = direction
    end

    def facing
      case
        when @direction == 'N'
          Constant::NORTH
        when @direction == 'E'
          Constant::EAST
        when @direction == 'W'
          Constant::WEST
        when @direction == 'S'
          Constant::SOUTH
      end
    end

  end
end
