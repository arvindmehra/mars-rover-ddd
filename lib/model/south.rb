module Model
  class South
    def turn_left
      Action::EAST
    end

    def turn_right
      Action::WEST
    end

    def move_forward(current_position)
      x = current_position[0]
      y = current_position[1] - 1

      [x, y]
    end

    def move_backward(current_position)
      x = current_position[0]
      y = current_position[1] + 1

      [x, y]
    end

    def to_s
      "S"
    end
  end
end
