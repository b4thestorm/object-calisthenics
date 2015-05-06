class Resume
  def initialize(owner)
    @owner = owner
    @owner.my_resumes << self
  end
end
