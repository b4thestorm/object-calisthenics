require 'csv'
require 'json'

class TheLadders

  def initialize
  end

  def csv_report(date)
    report_info = build_report_hash(date)
    report_info = report_info.collect
    CSV.open("report.csv", "w") do |csv|
      csv << report_info.keys
      csv << ["another", "row"]
      #work in progress
    end
  end

  def html_report(date)
    report_info = build_report_hash(date)
    report_info.to_json
  end

  def build_report_hash(date)
    report_hash = { "Jobseeker" => [], "Job" => [], "Employer" => [], "Date" => [] }
    applications = JobApplication.all_applications_on_date(date)
    applications.each do |application|
      report_hash["Jobseeker"] << application.applier.applicant.name
      report_hash["Job"] << application.application_details.job.title
      report_hash["Employer"] << application.application_details.job.owner.name
      report_hash["Date"] << application.application_details.date
    end
    report_hash
  end

end
