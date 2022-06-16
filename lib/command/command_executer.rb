require_relative '../exception'

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
          when command.upcase == 'U'
            @rover.undo_command
          else
            raise InvalidCommand.new
        end
      end
    end
  end
end
