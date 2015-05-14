class Employer < Person
  @@all_employers = Employers.new

  def initialize(name)
    super(name)
    @@all_employers.all << self
  end

  def self.all_employers
    @@all_employers
  end

  def post_job(title, resume = false)
    Job.new(title, self, resume)
  end

  def my_jobs
    Job.all_jobs.select { |job| job.is_owned?(self) }
  end

  def my_applied_jobs
    JobApplication.all_applications.select { |app| app.is_owner?(self) }
  end

  def return_applicants_of_applications(applications)
    applications.map {|app| app.applicant }
  end

  def date_search(date)
    applications = my_applied_jobs.select { |app| app.is_date?(date) }
    return_applicants_of_applications(applications)
  end

  def job_search(job)
    applications = my_applied_jobs.select { |app| app.is_job?(job) }
    return_applicants_of_applications(applications)
  end

  def date_and_job_search(date, job)
     applications = my_applied_jobs.select { |app| app.is_date?(date) && app.is_job?(job) }
     return_applicants_of_applications(applications)
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
