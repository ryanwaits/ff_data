module CoreExtensions
    module Fantasy
        module Date
            def self.current_date
                Time.now.year.to_s + '-' + Time.now.asctime.split(' ')[1] + '-' + Time.now.day.to_s
            end

            def self.regular_season
                Time.now.year.to_s + 'REG'
            end

            def self.last_season
                ((Time.now.year) -1).to_s
            end
        end
    end
end