require_relative './action'

module Model
  module Directions
    def self.facing(direction)
     case
       when direction == 'N'
         Action::NORTH
       when direction == 'E'
         Action::EAST
       when direction == 'W'
         Action::WEST
       when direction == 'S'
         Action::SOUTH
      end
    end

  end
end
