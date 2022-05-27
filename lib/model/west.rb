module Model
  class West
    def turn_left
      Constant::SOUTH
    end

    def turn_right
      Constant::NORTH
    end

    def move_forward(current_position)
      x = current_position[0] - 1
      y = current_position[1]

      [x, y]
    end

    def move_backward(current_position)
      x = current_position[0] + 1
      y = current_position[1]

      [x, y]
    end

    def to_s
      "W"
    end
  end
end
