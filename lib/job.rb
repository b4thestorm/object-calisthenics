class Job
  @@jobs = Jobs.new

  attr_accessor :title, :owner

  def initialize(title, owner)
    @title = Title.new(title)
    @owner = owner
    @@jobs.all << self
  end

  def self.all_jobs
    @@jobs.all
  end
end
