class Song < ApplicationRecord

    validates :title, presence: true
    validates :title, uniqueness: :artist_name && :release_year
    validates :release_year, presence: true, if: :is_released
    validates :artist_name, presence: true 
    validates :release_year, numericality: {less_than_or_equal_to: Date.current.year}, if: :is_released


    def is_released 
        self.released == true
    end

   
end
