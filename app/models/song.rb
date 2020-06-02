class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :title, uniqueness: { scope: [:release_year, :artist_name] }
    validates :released, inclusion: { in: [true, false] }
    validate :release_year_presence
    validates :artist_name, presence: true
  
    def release_year_presence
        if self.released
            if !self.release_year
                errors.add(:release_year)
            else
                now = Time.new

                if now.year < self.release_year
                    errors.add(:release_year)
                end
            end
        end
    end
end