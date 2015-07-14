class Employer < Person

  def initialize(name)
    super(name)
    All_Employers.add(self)
  end

  def post_job(title, resume = false)
    Job.new(title, self, resume)
  end

  def my_jobs
    All_Jobs.jobs_for(self)
  end

  def my_applied_jobs
    All_Applications.owned_by(self)
  end

  def add_successes
    successes = Count.new
    my_jobs.each do |job|
      successes.add(job.successes)
    end
    successes
  end

  def add_fails
    fails = Count.new
    my_jobs.each do |job|
      fails.add(job.fails)
    end
    fails
  end
end
