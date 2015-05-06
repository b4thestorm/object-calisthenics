class JobSeeker < Person
  attr_accessor :saved_jobs

  def initialize(name)
    super(name)
    @saved_jobs = []
  end

  def save_job(job)
    @saved_jobs << job
  end

end
