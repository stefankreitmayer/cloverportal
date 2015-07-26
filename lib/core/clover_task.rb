class CloverTask
  def self.part_name index
    "#{part_names[index % part_names.length]} #{index / part_names.length == 0 ? '' : index / part_names.length + 1}"
  end

  def self.part_names
    @part_names ||= %w(red green blue orange purple)
  end
end
