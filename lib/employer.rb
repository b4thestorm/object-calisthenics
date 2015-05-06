class Employer < Person
  def initialize(name)
    super(name)
  end

  def post_job(title)
    Job.new(title, self)
  end

  def my_jobs
    Job.all_jobs.select { |job| job.owner == self }
  end
end
