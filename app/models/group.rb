class Group < ActiveRecord::Base
  has_many :parts
  has_one :lead

  validates :groupname, presence: true, uniqueness: true

  def unassigned_parts
    parts.where(assigned: 'none')
  end

  def self_assigning_parts
    parts.where(assigned: 'choosing')
  end

  def assigned_parts
    parts.where(assigned: 'index')
  end
end
