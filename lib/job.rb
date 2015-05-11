class Job
  @@jobs = Jobs.new

  attr_accessor :essence, :job_info

  def initialize(title, owner, type = nil)
    @job_info = JobInfo.new(type)
    @essence = JobEssence.new(owner, title)
    @@jobs.all << self
  end

  def is_owned?(employer)
    @essence.is_owned?(employer)
  end

  def self.all_jobs
    @@jobs.all
  end

  def needs_resume?
    @job_info.needs_resume?
  end

  def print_owner_name
    @essence.print_owner
  end

  def print_title
    @essence.print_title
  end

  def job_success
    @job_info.increase("successes")
  end

  def job_fail
    @job_info.increase("fails")
  end

  def display
    print_title
    print ", "
    print_owner_name
  end

end
