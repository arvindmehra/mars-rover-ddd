module Command
  class CommandExecuter

    def initialize(rover)
      @rover = rover
    end

    def execute(command_line)
      command_line.each_char do |command|
        case
          when command.upcase == 'L'
            @rover.turn_left
          when command.upcase == 'R'
            @rover.turn_right
          when command.upcase == 'F'
            @rover.move_forward
          when command.upcase == 'B'
            @rover.move_backward
        end
      end
    end
  end
end
