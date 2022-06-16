class InvalidCommand < StandardError

  def initialize(msg="Invalid Command, Please input one of them [L, R, F, B]")
    super
  end

end
