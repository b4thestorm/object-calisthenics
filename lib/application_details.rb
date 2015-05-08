class ApplicationDetails
  attr_accessor :job, :date

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
end
