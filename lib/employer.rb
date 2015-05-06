class Employer < Person
  def initialize(name)
    super(name)
  end

  def post_job(title, resume = false)
    Job.new(title, self, resume)
  end

  def my_jobs
    Job.all_jobs.select { |job| job.owner == self }
  end
end
