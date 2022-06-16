module Entity
  class Grid

    attr_reader :size, :obstacle

    def initialize(grid_size)
      @size = grid_size.chars[0,2].map(&:to_i)
      @obstacle = grid_size.chars[2,4].map(&:to_i)
    end

  end
end
