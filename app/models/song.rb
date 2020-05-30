class Song < ApplicationRecord
    validates :title, presence: true
    validates_uniqueness_of :title, scope: [:artist_name, :release_year]
    validates_inclusion_of :released, in: [true, false]
    validates :artist_name, presence: true
    validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }, unless: Proc.new { self.released == false }

end
