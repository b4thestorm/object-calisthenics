class JobApplication

  def initialize(applicant, job, date, resume = nil)
    @applier = Applier.new(applicant, resume)
    @application_details = ApplicationDetails.new(job, date)
    All_Applications.add(self)
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

  def print_info
    @applier.print_jobseeker_name
    print ","
    @application_details.print_job_name
    print ","
    @application_details.print_employer_name
    print ","
    @application_details.print_date
  end
end
