require_relative "./entity/rover"
require_relative "./command/command_executer"
require_relative "./entity/grid"
require_relative "./query/rover_position"
require 'pry'

require 'optparse'

class RoverTraverserParser
  def self.parse(args)
    options = {}
    opts = OptionParser.new do |opts|
      opts.on('-g', '--grid GRID', 'grid size with obstacles e.g 6602') do |grid|
        options[:grid] = grid
      end
      opts.on('-p', '--position POSITION', 'position of the rover with direction e.g 12W') do |position|
        options[:position] = position
      end
      opts.on('-c', '--commands COMMAND', 'commands for rover to move e.g LFLFLFLFU') do |commands|
        options[:commands] = commands
      end

    end
    opts.parse(args)
    options
  end
end

options = RoverTraverserParser.parse(ARGV)

puts "Grid size with obstacles, #{options[:grid]}" if options[:grid]
puts "Rover position, #{options[:position]}" if options[:position]
puts "Rover commands, #{options[:commands]}" if options[:commands]

grid_size = options[:grid]
grid = Entity::Grid.new(grid_size)


rover_position = options[:position]
position = rover_position.chars[0, 2]
direction = Model::Directions.new(rover_position.chars[2]).facing
rover = Entity::Rover.new(grid, direction, position)
Command::CommandExecuter.new(rover).execute options[:commands].strip
puts "--------------------------------"
puts "Rover Position after traversing"
puts rover


