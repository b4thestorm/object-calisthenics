class JobInfo

  attr_accessor :counts, :type

  def initialize(type = nil)
    @counts = Counts.new
    @type = type
  end

  def increase(type)
    @counts.increase(type)
  end

  def needs_resume?
    !!@type
  end

end
