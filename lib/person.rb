class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def print_name
    @name.print_self
  end

  def display
    @name.print_self
  end
end
