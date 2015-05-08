class JobInfo

  attr_accessor :title, :type

  def initialize(title, type = nil)
    @title = title
    @type = type
  end

end
