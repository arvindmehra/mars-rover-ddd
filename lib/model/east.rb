module Model
  class East
    def turn_left
      Constant::NORTH
    end

    def turn_right
      Constant::SOUTH
    end

    def move_forward(current_coordinate)
      x, y = current_coordinate
      x = x + 1

      [x, y]
    end

    def move_backward(current_coordinate)
      x, y = current_coordinate
      x = x + 1

      [x, y]
    end

    def to_s
      "E"
    end
  end
end
