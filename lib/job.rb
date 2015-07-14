class Job

  def initialize(title, owner, type = nil)
    @job_info = JobInfo.new(type)
    @essence = JobEssence.new(owner, title)
    All_Jobs.add(self)
  end

  def is_owned?(employer)
    @essence.is_owned?(employer)
  end

  def is_title?(title)
    @essence.is_title?(title)
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

  def print_counts
    @job_info.print_counts
  end

  def job_success
    @job_info.increase_successes
  end

  def job_fail
    @job_info.increase_fails
  end

  def successes
    @job_info.successes
  end

  def fails
    @job_info.fails
  end

  def display
    print_title
    print ", "
    print_owner_name
  end

end
