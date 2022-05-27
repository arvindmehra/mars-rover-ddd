require_relative "../lib/entity/rover"
require_relative "../lib/command/command_executer"
require_relative "../lib/entity/grid"
require_relative "../lib/model/action"


describe Entity::Rover do

  subject { Entity::Rover.new(grid, direction, rover_coordinates) }
  let(:grid) { Entity::Grid.new("6 6 3 4") }
  let(:direction) { Model::Directions.new("W").facing }
  let(:rover_coordinates) { [1, 2] }
  let(:rover_command) { Command::CommandExecuter.new(subject) }

  it "new instance should set rover position and direction" do
    expect(subject.position).to eq rover_coordinates
  end

  describe "when receive single command" do
    it "moves forward when command is F" do
      expected = [0,2]
      rover_command.execute("F")
      expect(subject.position).to eq expected
    end

    it "moves backward when command is B" do
      expected = [2,2]
      rover_command.execute("B")
      expect(subject.position).to eq expected
    end

    it "turns left when command is L" do
      rover_command.execute("L")
      expect(subject.direction).to eq Model::Action::SOUTH
    end

    it "turns left when command is R" do
      rover_command.execute("R")
      expect(subject.direction).to eq Model::Action::NORTH
    end

    it "ignores command case" do
      rover_command.execute("r")
      expect(subject.direction).to eq Model::Action::NORTH
    end

    # it "throws exception when command is unknown" do
    #   expect(rover_command.execute("X") ).to raise_exception
    # end
  end

  it "able to receive multiple commands" do
    expected_position = [1,3]
    rover_command.execute("RFR")
    expect(subject.position).to eq expected_position
    expect(subject.direction).to eq Model::Action::EAST
  end

  it "moves from one edge of the grid to another" do
    expected_position = [1,-1];
    rover_command.execute("LFFF")
    expect(subject.position).to eq expected_position
  end

  it "stops when obstacle is found" do
    expected_position = [2, 4]
    rover_command.execute("RFFRF")
    expect(subject.position).to eq expected_position
    expect(subject.direction).to eq Model::Action::EAST
  end

  # This test doesnt't makes sense is same like above
  # it "position returns X Y and Direction" do
  #   subject.execute_commands("LFFFRFF")
  #   subject.position.must_equal "8 X 4 N"
  # end

  # it "position returns NOK when obstacle is found" do
  #   rover_command.execute("F")
  #   expect(subject).to eq "NOK"
  # end
end
