class Employer < Person
  def initialize(name)
    super(name)
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

  def date_search(date)
    applications = my_applied_jobs.select { |app| app.is_date?(date) }
    applications.map {|app| app.applicant }
  end

  def job_search(job)
    applications = my_applied_jobs.select { |app| app.is_job?(job) }
    applications.map {|app| app.applicant }
  end

  def date_and_job_search(date, job)
     applications = my_applied_jobs.select { |app| app.is_date?(date) && app.is_job?(job) }
     applications.map {|app| app.applicant }
  end
end
