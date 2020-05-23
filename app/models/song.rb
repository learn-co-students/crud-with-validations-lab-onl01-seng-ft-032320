class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :released, inclusion: { in: [true, false] }
    validates :title, uniqueness: { scope: :release_year }
    validate :valid_release?

   
    def valid_release?
        if released
            if !release_year.present?
                errors.add(:release_year, "Released Song must have a released year.")
            elsif Time.new.year < release_year
                    errors.add(:release_year, "Release year cannot be in the future")
                
            end
        end
    end

end

