class ApplicantListBuilder
  def initialize
  end

  def return_applicants_of_applications(applications)
    applications.map {|app| app.applicant }
  end
end
