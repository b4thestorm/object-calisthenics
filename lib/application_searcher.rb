class ApplicationSearcher
  def initialize
  end

  def date_and_employer_search(employer, date)
    applications = All_Applications.owned_by(employer)
    applications.select! { |app| app.is_date?(date) }
    Applicant_List_Builder.return_applicants_of_applications(applications)
  end

  def job_and_employer_search(employer, job)
    applications = All_Applications.owned_by(employer)
    applications.select! { |app| app.is_job?(job) }
    Applicant_List_Builder.return_applicants_of_applications(applications)
  end

  def date_and_job_search(employer, date, job)
    applications = All_Applications.owned_by(employer)
    applications.select! { |app| app.is_date?(date) && app.is_job?(job) }
    Applicant_List_Builder.return_applicants_of_applications(applications)
  end
end
