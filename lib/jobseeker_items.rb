class JobseekerItems
  attr_accessor :jobs

  def initialize
    @jobs = Jobs.new
    @resumes = []
  end

  def has_resume?(resume)
    @resumes.include?(resume)
  end

  def add_job(job)
    @jobs.add(job)
  end

  def add_resume(resume)
    @resumes << resume
  end

  def my_job?(job)
    @jobs.include?(job)
  end
end
