module Model
  class West
    def turn_left
      Constant::SOUTH
    end

    def turn_right
      Constant::NORTH
    end

    def move_forward(current_coordinate)
      x, y = current_coordinate
      x = x - 1

      [x, y]
    end

    def move_backward(current_coordinate)
      x, y = current_coordinate
      x = x + 1

      [x, y]
    end

    def to_s
      "W"
    end
  end
end
