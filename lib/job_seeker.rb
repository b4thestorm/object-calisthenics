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
    job_apply_tool = JobApplyTool.new
    job_apply_tool.apply_to_job(job, self, resume)
  end

  def applied_jobs
    All_Applications.applied_by(self)
  end

end
