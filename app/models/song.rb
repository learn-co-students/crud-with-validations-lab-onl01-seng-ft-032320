class Song < ApplicationRecord
    validates :title, :artist_name, :genre, presence: true
    validates :title, uniqueness: true
    with_options if: :released? do |release|
        release.validates :release_year, numericality: { less_than_or_equal_to: 2020 }
        release.validates :release_year, presence: true
    end

end
