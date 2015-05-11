require 'rspec'
require_relative '../lib/dependencies.rb'

describe "TheLadders" do
  before(:all) do
    @name = Name.new("Bob")
    @name2 = Name.new("Mary")
    @title = Title.new("Account Manager")
    @title2 = Title.new("Sales Manager")
    @title3 = Title.new("CEO")
    @bob = Employer.new(@name)
    @mary = Employer.new(@name2)
    @job = @bob.post_job(@title)
    @job2 = @bob.post_job(@title2)
    @job3 = @mary.post_job(@title3)
    @job4 = @bob.post_job(@title2, true)
    @bobs_jobs = @bob.my_jobs
    @name3 = Name.new("Matt")
    @matt = JobSeeker.new(@name3)
    @matt.save_job(@job)
    @name4 = Name.new("Sarah")
    @sarah = JobSeeker.new(@name4)
    @matt_resume = Resume.new(@matt)
    @matt_resume2 = Resume.new(@matt)
    @sarah_resume = Resume.new(@sarah)
    @apply1 = @matt.apply(@job, @matt_resume)
    @apply2 = @matt.apply(@job2)
    @apply3 = @matt.apply(@job3)
    @saved_jobs = @matt.saved_jobs
    @matts_jobs = @matt.applied_jobs
    @sarahs_jobs = @sarah.applied_jobs
    @apply4 = @sarah.apply(@job, @sarah_resume)
    @ladders = TheLadders.new
    @ladders.csv_report(Date.today)
  end

  describe "post a job" do
    it "creates a new job" do
      expect(@job.job_info.title).to eq(@title)
      expect(@job.is_owned?(@bob)).to be_truthy
    end
    it "adds the job to the jobs list" do
      expect(Job.all_jobs).to include(@job)
    end
  end

  describe "employers can see all their jobs" do
    it "returns all employer's jobs" do
      expect(@bobs_jobs).to include(@job, @job2)
    end
    it "doesn't return other employer's jobs" do
      expect(@bobs_jobs).not_to include(@job3)
    end
  end

  describe "save a job" do
    it "allows the user to see saved jobs" do
      expect(@saved_jobs).to include(@job)
    end
  end

  describe "apply to a job" do
    it "allows user to apply to JReq with resume" do
      expect(@matts_jobs).to include(@apply1)
    end
    it "doesn't allows user to apply to JReq without resume" do
      expect { @matt.apply(@job4) }.to raise_error
    end
    it "allows user to apply to AST without resume" do
      expect(@matts_jobs).to include(@apply2)
    end
    it "doesn't allows user to apply with another's resume" do
      expect { @matt.apply(@job4, @sarah_resume) }.to raise_error
    end
    it "allows user to apply to jobs with different resume" do
      expect(@matts_jobs).to include(@apply3)
    end
  end

  describe "employers see jobseekers list" do
    it "allows employer to see all jobseekers who applied to a job" do
      expect(@bob.job_search(@job)).to include(@matt, @sarah)
    end
    it "allows employer to see all jobseekers who applied on a date" do
      expect(@bob.date_search(Date.today)).to include(@matt, @sarah)
    end
    it "allows employer to see all jobseekers who applied to a job on a date" do
      expect(@bob.date_and_job_search(Date.today, @job2)).to include(@matt)
      expect(@bob.date_and_job_search(Date.today, @job2)).not_to include(@sarah)
    end
  end
end
