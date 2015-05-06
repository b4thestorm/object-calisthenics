require 'date'
class JobSeeker < Person
  attr_accessor :saved_jobs, :my_resumes

  def initialize(name)
    super(name)
    @saved_jobs = []
    @my_resumes = []
  end

  def save_job(job)
    @saved_jobs << job
    nil
  end

  def apply(job, resume = nil)
    if !resume && job.needs_resume?
      raise "resume needed for this job"
      return
    end

    if resume && !my_resumes.include?(resume)
      raise "cannot use another users resume"
      return
    end

    application = JobApplication.new(self, job, Date.today, resume)

  end

  def applied_jobs
    JobApplication.all_applications.select { |application| application.applier.applicant == self }
  end

end