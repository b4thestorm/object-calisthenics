require 'rspec'
require_relative '../lib/dependencies.rb'


describe "post a job" do
  bob = Employer.new("Bob")
  job = bob.post_job("Account Manager")
  it "creates a new job" do
    expect(job.job_info.title.name).to eq("Account Manager")
    expect(job.owner).to eq(bob)
  end

  it "adds the job to the jobs list" do
    expect(Job.all_jobs).to include(job)
  end
end

describe "employers can see all their jobs" do
  bob = Employer.new("Bob")
  mary = Employer.new("Mary")
  job = bob.post_job("Account Manager")
  job2 = bob.post_job("Sales Manager")
  job3 = mary.post_job("CEO")
  bobs_jobs = bob.my_jobs

  it "returns all employer's jobs" do
    expect(bobs_jobs).to include(job)
    expect(bobs_jobs).to include(job2)
  end

  it "doesn't return other employer's jobs" do
    expect(bobs_jobs).not_to include(job3)
  end
end

describe "save a job" do
  matt = JobSeeker.new("Matt")
  bob = Employer.new("Bob")
  job = bob.post_job("Account Manager")
  matt.save_job(job)
  saved_jobs = matt.saved_jobs

  it "allows the user to see saved jobs" do
    expect(saved_jobs).to include(job)
  end
end

describe "apply to a job" do
  matt = JobSeeker.new("Matt")
  mary = JobSeeker.new("Mary")
  bob = Employer.new("Bob")
  job = bob.post_job("Account Manager", true)
  job2 = bob.post_job("Sales Manager")
  job3 = bob.post_job("Assistant")
  matt_resume = Resume.new(matt)
  matt_resume2 = Resume.new(matt)
  mary_resume = Resume.new(mary)
  apply1 = matt.apply(job, matt_resume)
  apply2 = matt.apply(job2)
  apply3 = matt.apply(job3)
  matts_jobs = matt.applied_jobs
  marys_jobs = mary.applied_jobs

  it "allows user to apply to JReq with resume" do
    expect(matts_jobs).to include(apply1)
  end
  it "doesn't allows user to apply to JReq without resume" do
    expect { matt.apply(job) }.to raise_error
  end
  it "allows user to apply to AST without resume" do
    expect(matts_jobs).to include(apply2)
  end
  it "doesn't allows user to apply with another's resume" do
    expect { matt.apply(job, mary_resume) }.to raise_error
  end
  it "allows user to apply to jobs with different resume" do
    expect(matts_jobs).to include(apply3)
  end



end
