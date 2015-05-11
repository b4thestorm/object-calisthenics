class Csv
  def initialize(applications)
    @applications = applications
  end

  def print_csv
    print_header
    print_values
  end

  def print_header
    puts "Jobseeker,Job,Employer,Date"
  end

  def print_values
    @applications.each do |app|
      print_line(app)
    end
  end

  def print_line(app)
    app.print_info
    print "\n"
  end
end
