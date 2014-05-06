class Tag < ActiveRecord::Base
  before_save :downcase_attributes

  has_and_belongs_to_many :articles

  validates :name, presence: true, uniqueness: true

  private

  def downcase_attributes
    self.name.downcase!
  end
end
