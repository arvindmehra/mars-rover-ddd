module Model
  class North
    def turn_left
      Constant::WEST
    end

    def turn_right
       Constant::EAST
    end

    def move_forward(current_coordinate)
      x, y = current_coordinate
      y = y + 1

      [x, y]
    end

    def move_backward(current_coordinate)
      x, y = current_coordinate
      y = y - 1

      [x, y]
    end

    def to_s
      "N"
    end
  end
end
