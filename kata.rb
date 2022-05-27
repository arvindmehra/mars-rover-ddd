Point       = Class.new(Struct.new(:location, :max_location))
Obstacle    = Class.new(Struct.new(:x, :y))
Coordinates = Class.new(Struct.new(:point_x, :point_y, :direction, :obstacles))

class Direction < Struct.new(:value, :name)
  NORTH = self.new(0, "N")
  EAST  = self.new(1, "E")
  SOUTH = self.new(2, "S")
  WEST  = self.new(3, "W")
end

class Rover < Struct.new(:coordinates)
  def execute_command(command); end
  def execute_commands(commands); end
  def position; end
end

require "minitest/autorun"
require "minitest/pride"

describe Rover do
# Source: http://dallashackclub.com/rover

# Develop an API that moves a rover around on a grid.
# * You are given the initial starting point (x,y) of a rover and the direction (N,S,E,W) it is facing.
# * - The rover receives a character array of commands.
# * - Implement commands that move the rover forward/backward (f,b).
# * - Implement commands that turn the rover left/right (l,r).
# * - Implement wrapping from one edge of the grid to another. (planets are spheres after all)
# * - Implement obstacle detection before each move to a new square.
# *   If a given sequence of commands encounters an obstacle, the rover moves up to the last possible point and reports the obstacle.
# *

  subject { Rover.new(rover_coordinates) }

  let(:x) { Point.new(1, 9) }
  let(:y) { Point.new(2, 9) }
  let(:obstacles) { [] }
  let(:direction) { Direction::NORTH }
  let(:rover_coordinates) { Coordinates.new(x, y, direction, obstacles) }

  it "new instance should set rover coordinates and direction" do
    subject.coordinates.must_equal rover_coordinates
  end

  describe "when receive single command" do
    it "moves forward when command is F" do
      expected = y.location + 1
      subject.execute_command("F")
      subject.coordinates.point_y.location.must_equal expected
    end

    it "moves backward when command is B" do
      expected = y.location - 1
      subject.execute_command("B")
      subject.coordinates.point_y.location.must_equal expected
    end

    it "turns left when command is L" do
      subject.execute_command("L")
      subject.coordinates.direction.must_equal Direction::WEST
    end

    it "turns left when command is R" do
      subject.execute_command("R")
      subject.coordinates.direction.must_equal Direction::EAST
    end

    it "ignores command case" do
      subject.execute_command("r")
      subject.coordinates.direction.must_equal Direction::EAST
    end

    it "throws exception when command is unknown" do
      -> { subject.execute_command("X") }.must_raise Exception
    end
  end

  it "able to receive multiple commands" do
    expected = x.location + 1;
    subject.execute_commands("RFR")
    subject.coordinates.point_x.location.must_equal expected
    subject.coordinates.direction.must_equal Direction::SOUTH
  end

  it "moves from one edge of the grid to another" do
    expected = x.max_location + x.location - 2;
    subject.execute_commands("LFFF")
    subject.coordinates.point_x.location.must_equal expected
  end

  it "stops when obstacle is found" do
    expected = x.location + 1;
    subject.coordinates.obstacles = [Obstacle.new(expected + 1, y.location)]
    subject.coordinates.direction = Direction::EAST
    subject.execute_commands("FFFRF")
    subject.coordinates.point_x.location.must_equal expected
    subject.coordinates.direction.must_equal Direction::EAST
  end

  it "position returns X Y and Direction" do
    subject.execute_commands("LFFFRFF")
    subject.position.must_equal "8 X 4 N"
  end

  it "position returns NOK when obstacle is found" do
    subject.coordinates.obstacles = [Obstacle.new(x.location + 1, y.location)]
    subject.coordinates.direction = Direction::EAST
    subject.execute_commands("F")
    assert subject.position.to_s.end_with?(" NOK")
  end
end
