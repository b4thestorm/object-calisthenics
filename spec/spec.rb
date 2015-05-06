require 'rspec'
require_relative '../lib/dependencies.rb'


describe "post a job" do
  bob = Employer.new("Bob")
  job = bob.post_job("Account Manager")
  it "creates a new job" do
    expect(job.title.name).to eq("Account Manager")
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
  it "saves the job" do
    expect(job.title.name).to eq("Account Manager")
    expect(job.owner).to eq(bob)
  end

  it "allows the user to see saved jobs" do
    expect(saved_jobs).to include(job)
  end
end

escribe "save a job" do
  matt = JobSeeker.new("Matt")
  bob = Employer.new("Bob")
  job = bob.post_job("Account Manager")
  matt.save_job(job)
  saved_jobs = matt.saved_jobs
  it "saves the job" do
    expect(job.title.name).to eq("Account Manager")
    expect(job.owner).to eq(bob)
  end

  it "allows the user to see saved jobs" do
    expect(saved_jobs).to include(job)
  end
end
