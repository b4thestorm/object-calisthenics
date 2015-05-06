class Applier
  attr_accessor :applicant

  def initialize(applicant, resume)
    @applicant = applicant
    @resume = resume
  end
end
