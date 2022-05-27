module Model
  class North
    def turn_left
      Constant::WEST
    end

    def turn_right
       Constant::EAST
    end

    def move_forward(current_position)
      x = current_position[0]
      y = current_position[1] + 1

      [x, y]
    end

    def move_backward(current_position)
      x = current_position[0]
      y = current_position[1] - 1

      [x, y]
    end

    def to_s
      "N"
    end
  end
end
