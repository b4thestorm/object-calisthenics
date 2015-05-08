class Resume
  def initialize(owner)
    @owner = owner
    @owner.add_resume(self)
  end

  def is_owner?(jobseeker)
    @owner == jobseeker
  end
end
