require_relative './south'
require_relative './north'
require_relative './east'
require_relative './west'

module Model
  class Constant
    NORTH = North.new
    EAST  = East.new
    WEST  = West.new
    SOUTH = South.new
  end

end
