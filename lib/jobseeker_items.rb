class JobseekerItems
  attr_accessor :jobs

  def initialize
    @jobs = []
    @resumes = []
  end

  def has_resume?(resume)
    @resumes.include?(resume)
  end

  def add_job(job)
    @jobs << job
  end

  def add_resume(resume)
    @resumes << resume
  end

  def my_job?(job)
    @jobs.include?(job)
  end
end
