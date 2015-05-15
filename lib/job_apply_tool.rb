class JobApplyTool
  def initialize
  end

  def apply_to_job(job, applier, resume)
    gives_resume_when_needed(job, resume) && applies_with_own_resume(job, resume, applier)
    job.job_success
    JobApplication.new(applier, job, Date.today, resume)
  end

  def gives_resume_when_needed(job, resume)
    if !resume && job.needs_resume?
      job.job_fail
      raise "resume needed for this job"
    end
    true
  end

  def applies_with_own_resume(job, resume, applier)
    if resume && !resume.is_owner?(applier)
      job.job_fail
      raise "cannot use another users resume"
    end
  end
end
