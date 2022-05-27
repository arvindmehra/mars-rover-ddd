require_relative "./entity/rover"
require_relative "./command/command_executer"
require_relative "./entity/grid"

grid_size = ARGF.gets
# binding.pry
grid = Entity::Grid.new(grid_size)

while !ARGF.eof
  rover_position = ARGF.gets
  position = rover_position.split[0, 2]
  direction = Model::Directions.new(rover_position.split[2]).facing
  rover = Entity::Rover.new(grid, direction, position)
  Command::CommandExecuter.new(rover).execute ARGF.gets

  puts rover
end
puts "--------------------------------"
