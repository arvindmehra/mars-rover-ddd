require_relative "../model/directions"
module Entity
  class Rover

    attr_reader :direction, :position, :grid

    def initialize(grid, initial_direction, initial_position)
      @grid = grid
      @direction = initial_direction
      @position = initial_position.map(&:to_i)
    end

    def turn_left
      @direction = @direction.turn_left
    end

    def turn_right
      @direction = @direction.turn_right
    end

    def move_forward
      @position = @direction.move_forward(@position)
      if @grid.obstacle == @position
        self.move_backward
        puts "NOK"
        return
      end
    end

    def move_backward
      @position = @direction.move_backward(@position)
      if @grid.obstacle == @position
        self.move_forward
        puts "NOK"
        return
      end
    end

    def to_s
      "#{position[0]} #{position[1]} #{direction}"
    end

  end
end
