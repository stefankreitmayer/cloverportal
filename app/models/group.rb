class Group < ActiveRecord::Base
  has_many :parts
  has_one :lead

  validates :groupname, presence: true, uniqueness: true

  def assigned_parts
    parts.where.not(index: nil)
  end

  def unassigned_parts
    parts.where(index: nil)
  end

  def auto_assign_parts
    index = 0
    unassigned_parts.each do |part|
      until parts.where(index: index).empty?
        index += 1
      end
      part.update(index: index)
      index += 1
    end
  end
end
