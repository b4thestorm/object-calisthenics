class JobInfo

  attr_accessor :title, :type

  def initialize(title, type = nil)
    @title = Title.new(title)
    @type = type
  end

end
