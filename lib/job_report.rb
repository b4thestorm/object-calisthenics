class JobReport

  def initialize
  end

  def print_report
    print_by_job
    print_by_employer
  end

  def print_by_job
    puts "Job Application Successes and Failures by Job"
    puts "Job Title,Successes,Failures"
    Job.jobs.print_job_success_and_failures
  end

  def print_by_employer
    puts "Job Application Successes and Failures by Employer"
    puts "Employer Name,Successes,Failures"
    Employer.all_employers.print_employer_success_and_failures
  end

end
