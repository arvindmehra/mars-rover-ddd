module Model
  class East
    def turn_left
      Action::NORTH
    end

    def turn_right
      Action::SOUTH
    end

    def move_forward(current_position)
      x = current_position[0] + 1
      y = current_position[1]

      [x, y]
    end

    def move_backward(current_position)
      x = current_position[0] - 1
      y = current_position[1]

      [x, y]
    end

    def to_s
      "E"
    end
  end
end
