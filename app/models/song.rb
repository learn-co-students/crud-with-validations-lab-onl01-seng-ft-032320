class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :artist_name, presence: true
  validates_inclusion_of :released, in: [true, false]
  validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Date.current.year }, presence: true, if: :was_released?

  def was_released?
    self.released == true
  end 

end
