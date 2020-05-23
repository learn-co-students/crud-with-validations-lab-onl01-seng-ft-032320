class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :released, inclusion: { in: [true, false] }
    validate :valid_release?
    validates_uniqueness_of :title, scope: :release_year

    def valid_release?
        if self.released
            if !self.release_year.present?
                errors.add(:release_year, "Released Song must have a released year.")
            else
                now = Time.new
                if now.year < self.release_year
                    errors.add(:release_year, "Release year cannot be in the future")
                end
            end
        end
    end
end

