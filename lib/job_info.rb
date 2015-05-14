class JobInfo

  attr_accessor :counts, :type

  def initialize(type = nil)
    @counts = Counts.new
    @type = type
  end

  def increase_successes
    @counts.increase_successes
  end

  def increase_fails
    @counts.increase_fails
  end

  def needs_resume?
    !!@type
  end

  def print_counts
    @counts.print_counts
  end

  def successes
    @counts.successes
  end

  def fails
    @counts.fails
  end

end
