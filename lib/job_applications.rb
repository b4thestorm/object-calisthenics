class JobApplications
  attr_accessor :all

  def initialize(applications = [])
    @all = applications
  end

  def print_all
    @all.each do |application|
      application.print_info
      print "\n"
    end
  end
end
