require_relative "../model/directions"
require_relative "../event/event_source"
# require 'pry'

module Entity
  class Rover

    attr_reader :direction, :position, :grid

    def initialize(grid, initial_direction, initial_position)
      @grid = grid
      @direction = initial_direction
      @position = initial_position.map(&:to_i)
      @event = Event::EventSource.new
    end

    def turn_left
      @direction = @direction.turn_left
      @event.store_events("L")
    end

    def turn_right
      @direction = @direction.turn_right
      @event.store_events("R")
    end

    def move_forward
      return if has_obstacle_forward?
      @position = @direction.move_forward(@position)
      @event.store_events("F")
    end

    def move_backward
      return if has_obstacle_backward?
      @position = @direction.move_backward(@position)
      @event.store_events("B")
    end

    def has_obstacle_forward?
      @grid.obstacle == @direction.move_forward(@position)
    end

    def has_obstacle_backward?
      @grid.obstacle == @direction.move_backward(@position)
    end

    def undo_command
      last_command = @event.event_trace.pop
      rollback_step(last_command) if !last_command.nil?
    end

    def rollback_step(last_command)
      if last_command == 'L'
        turn_right
      elsif last_command == 'R'
        turn_left
      elsif last_command == 'F'
        move_backward
      elsif last_command == 'B'
        move_forward
      end
    end

    def to_s
      "#{position[0]} #{position[1]} #{direction}"
    end

  end
end
