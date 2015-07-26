class Group < ActiveRecord::Base
  has_many :parts
  has_one :lead

  validates :groupname, presence: true, uniqueness: true

  def parts_count
    parts.length
  end
end
