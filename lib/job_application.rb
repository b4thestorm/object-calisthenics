class JobApplication
  @@job_applications = JobApplications.new

  attr_accessor :applier, :application_details

  def initialize(applicant, job, date, resume = nil)
    @applier = Applier.new(applicant, resume)
    @application_details = ApplicationDetails.new(job, date)
    @@job_applications.all << self
  end

  def self.all_applications
    @@job_applications.all
  end

  def self.all_applications_on_date(date)
    self.all_applications.select { |application| application.is_date?(date) }
  end

  def applicant?(jobseeker)
    @applier.applicant?(jobseeker)
  end

  def is_owner?(owner)
    @application_details.is_owner?(owner)
  end

  def is_date?(date)
    @application_details.is_date?(date)
  end

  def is_job?(job)
    @application_details.is_job?(job)
  end

  def applicant
    @applier.return_applicant
  end

  def print_jobseeker_name
    @applier.print_jobseeker_name
  end

  def print_job_name
    @application_details.print_job_name
  end

  def print_employer_name
    @application_details.print_employer_name
  end

  def print_date
    @application_details.print_date
  end
end
