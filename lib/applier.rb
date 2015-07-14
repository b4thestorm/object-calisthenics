class Applier

  def initialize(applicant, resume)
    @applicant = applicant
    @resume = resume
  end

  def applicant?(jobseeker)
    @applicant == jobseeker
  end

  def return_applicant
    @applicant
  end

  def print_jobseeker_name
    @applicant.print_name
  end
end
