module Model
  class South
    def turn_left
      Constant::EAST
    end

    def turn_right
      Constant::WEST
    end

    def move_forward(current_coordinate)
      x, y  = current_coordinate
      y = y - 1

      [x, y]
    end

    def move_backward(current_coordinate)
      x, y = current_coordinate
      y = y + 1

      [x, y]
    end

    def to_s
      "S"
    end
  end
end
