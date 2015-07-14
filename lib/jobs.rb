class Jobs

  def initialize(jobs= [])
    @all = jobs
  end

  def print_job_success_and_failures
    @all.each do |job|
      job.print_title
      print ","
      job.print_counts
      print "\n"
    end
  end

  def include?(job)
    @all.include?(job)
  end

  def add(job)
    @all << job
  end

  def all
    @all
  end

  def jobs_for(employer)
    @all.select { |job| job.is_owned?(employer) }
  end

end
