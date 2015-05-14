class Employers
  attr_accessor :all
  def initialize(all = [])
    @all = all
  end

  def print_employer_success_and_failures
    @all.each do |employer|
      employer.print_name
      print ","
      print_counts(employer)
      print "\n"
    end
  end

  def print_counts(employer)
    successes = employer.add_successes
    successes.print_self
    print ","
    fails = employer.add_fails
    fails.print_self
  end

end
