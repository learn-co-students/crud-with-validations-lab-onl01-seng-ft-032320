class SongValidator < ActiveModel::Validator

    def validate(record)
        if record.released
            
            unless record.release_year
                record.errors[:release_year] << "Released Song must have a released year."
            else 
                current_year = Time.new.year
                if record.release_year > current_year
                    record.errors[:release_year] << "Release year is in the future."
                end
            end 

        end   
        
    end
end