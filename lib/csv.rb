class Csv
  def initialize(applications)
    @applications = JobApplications.new(applications)
  end

  def print_csv
    print_header
    print_values
  end

  def print_header
    puts "Jobseeker,Job,Employer,Date"
  end

  def print_values
    @applications.print_all
  end
end
