class Song < ApplicationRecord
    validates :title, presence: true 
    validates :artist_name, presence: true
    validates :title, uniqueness: {scope: [:artist_name, :release_year]}
    validate :release_year_presence, :future_release

    def release_year_presence
        if released && !release_year.present?
            errors.add(:release_year, "Must have a release date if song has been released")
        end
    end

    def future_release
        if release_year.present? && release_year > DateTime.now.year
            errors.add(:release_year, "Release Year cannot be in the future")
        end
    end


end