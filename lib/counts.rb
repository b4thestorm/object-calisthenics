class Counts
  def initialize
    @successes = Count.new
    @fails = Count.new
  end

  def increase(type)
    instance_variable_get("@#{type}").increase
  end
end
