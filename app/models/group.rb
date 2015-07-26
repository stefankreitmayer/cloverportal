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
end
