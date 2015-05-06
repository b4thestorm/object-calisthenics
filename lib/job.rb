class Job
  @@jobs = Jobs.new

  attr_accessor :title, :owner, :job_info

  def initialize(title, owner, type = nil)
    @job_info = JobInfo.new(title, type)
    @owner = owner
    @@jobs.all << self
  end

  def self.all_jobs
    @@jobs.all
  end

  def needs_resume?
    !!@job_info.type
  end
end
