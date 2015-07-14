class ApplicationDetails

  def initialize(job, date)
    @job = job
    @date = date
  end

  def is_owner?(owner)
    @job.is_owned?(owner)
  end

  def is_date?(date)
    @date == date
  end

  def is_job?(job)
    @job == job
  end

  def print_job_name
    @job.print_title
  end

  def print_employer_name
    @job.print_owner_name
  end

  def print_date
    print @date
  end
end
