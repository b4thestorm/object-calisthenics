class Applier
  attr_accessor :applicant

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
end
