class Group
  THE_GROUPNAME = 'b'
  def self.find(groupname)
    if groupname == THE_GROUPNAME
      the_group
    else
      nil
    end
  end

  private

  def self.the_group
    @group ||= self.new
  end
end
