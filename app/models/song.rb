class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: {
    scope: [:release_year, :artist_name],
    message: "Cannot be repeated by the same artist in the same year."
  }
  validates :release_year, presence: true, if: :released?
  validates :released, inclusion: {in: [true, false]}
  validate :check_future_date

  def check_future_date
    if release_year.present? && release_year > Date.today.year
      errors.add(:release_year, "Must be less than or equal to the current year")
    end
  end

end
