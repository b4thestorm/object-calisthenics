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
    All_Jobs.print_job_success_and_failures
  end

  def print_by_employer
    puts "Job Application Successes and Failures by Employer"
    puts "Employer Name,Successes,Failures"
    All_Employers.print_employer_success_and_failures
  end

end
