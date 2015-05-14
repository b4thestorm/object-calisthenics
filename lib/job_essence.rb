class JobEssence
  attr_accessor :title

  def initialize(owner, title)
    @owner = owner
    @title = title
  end

  def is_owned?(employer)
    @owner == employer
  end

  def is_title?(title)
    @title == title
  end

  def print_owner
    @owner.print_name
  end

  def print_title
    @title.print_self
  end

end
