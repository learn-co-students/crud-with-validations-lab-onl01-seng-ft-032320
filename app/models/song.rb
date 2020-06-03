class Song < ApplicationRecord
    validates :title, presence: true
    validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, presence: true, if: :released?
    validates :release_year, uniqueness: true

    def released?
        released == true
    end
end
 

