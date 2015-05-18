class Jobs
  attr_accessor :all
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

end
