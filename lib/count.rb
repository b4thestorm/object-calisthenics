class Count
  attr_accessor :number

  def initialize(number = 0)
    @number = number
  end

  def increase
    @number += 1
  end
end
