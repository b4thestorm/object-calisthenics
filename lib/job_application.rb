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
end
