require 'date'
class JobSeeker < Person
  attr_accessor :jobseeker_items, :my_resumes

  def initialize(name)
    super(name)
    @jobseeker_items = JobseekerItems.new
  end

  def save_job(job)
    @jobseeker_items.add_job(job)
    nil
  end

  def add_resume(resume)
    @jobseeker_items.add_resume(resume)
    nil
  end

  def saved_jobs
    @jobseeker_items.jobs
  end

  def apply(job, resume = nil)
    if !resume && job.needs_resume?
      #job.job_fail
      raise "resume needed for this job"
      return
    end
    if resume && !resume.is_owner?(self)
      #job.job_fail
      raise "cannot use another users resume"
      return
    end
    #job.job_success
    application = JobApplication.new(self, job, Date.today, resume)

  end

  def applied_jobs
    JobApplication.all_applications.select { |application| application.applicant?(self) }
  end

end
