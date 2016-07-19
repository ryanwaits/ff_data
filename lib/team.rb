require_relative 'initializer'

class Team
    extend API::Request

    # returns news about a team
    def self.news team
        request_service('NewsByTeam', team)
    end

    # returns teams and their bye weeks
    def self.byes
        request_service('Byes', CoreExtensions::Fantasy::Date.regular_season)
    end

    # returns teams based on week
    def self.bye_week week, teams = []
        self.byes.each { |team| teams.push(team) if team['Week'] == week }
        teams
    end

    # returns all team defense statistics for the week
    def self.defenses week
        request_service('FantasyDefenseByGame', [CoreExtensions::Fantasy::Date.last_season, week])
    end

    # returns a teams defense statistics for the week
    def self.defense team, week
        request_service('FantasyDefenseByGameByTeam', [CoreExtensions::Fantasy::Date.last_season, week, team])
    end

    # returns defense scoring statistics for the season
    def self.defense_scoring
        request_service('FantasyDefenseBySeason', CoreExtensions::Fantasy::Date.last_season)
    end

    # returns defense projections for the season
    def self.defense_projections
        request_service('FantasyDefenseProjectionsBySeason', CoreExtensions::Fantasy::Date.last_season)
    end

    # returns defense scoring statistics by team
    def self.defense_scoring_by_team team
        request_service('FantasyDefenseBySeasonByTeam', [CoreExtensions::Fantasy::Date.last_season, team])
    end

    # returns schedule for given season
    def self.schedule
        request_service('Schedules', CoreExtensions::Fantasy::Date.regular_season)
    end

    # returns scores for given season
    def self.scores
        request_service('Scores', CoreExtensions::Fantasy::Date.last_season)
    end

    # returns scores for given week
    def self.scores_by_week week
        request_service('ScoresByWeek', [CoreExtensions::Fantasy::Date.last_season, week])
    end

    # returns standings
    def self.standings
        request_service('Standings', CoreExtensions::Fantasy::Date.last_season)
    end

end