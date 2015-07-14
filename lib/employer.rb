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

  def date_search(date)
    applications = my_applied_jobs.select { |app| app.is_date?(date) }
    Applicant_List_Builder.return_applicants_of_applications(applications)
  end

  def job_search(job)
    applications = my_applied_jobs.select { |app| app.is_job?(job) }
    Applicant_List_Builder.return_applicants_of_applications(applications)
  end

  def date_and_job_search(date, job)
     applications = my_applied_jobs.select { |app| app.is_date?(date) && app.is_job?(job) }
     Applicant_List_Builder.return_applicants_of_applications(applications)
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
