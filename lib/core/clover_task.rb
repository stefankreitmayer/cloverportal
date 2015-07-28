class CloverTask
  def self.character_name index
    "#{character_names[index % character_names.length]} #{index / character_names.length == 0 ? '' : index / character_names.length + 1}"
  end

  def self.character_names
    @character_names ||= %w(red green blue orange purple)
  end
end
