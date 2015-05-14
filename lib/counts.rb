class Counts
  attr_accessor :successes, :fails

  def initialize
    @successes = Count.new
    @fails = Count.new
  end

  def increase_successes
    @successes.increase
  end

  def increase_fails
    @fails.increase
  end

  def print_counts
    @successes.print_self
    print ","
    @fails.print_self
  end

  def successes
    @successes.number
  end

  def fails
    @fails.number
  end
end
