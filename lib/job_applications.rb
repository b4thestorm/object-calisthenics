class JobApplications
  attr_accessor :all

  def initialize(applications = [])
    @all = applications
  end

  def add(application)
    @all << application
  end

  def all_applications_on_date(date)
    @all.select { |application| application.is_date?(date) }
  end

  def owned_by(employer)
    @all.select { |application| application.is_owner?(employer) }
  end

  def applied_by(jobseeker)
    @all.select { |application| application.applicant?(jobseeker) }
  end

  def print_all
    @all.each do |application|
      application.print_info
      print "\n"
    end
  end
end
