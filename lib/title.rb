class Title
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def print_self
    print @name
  end
end
